import 'dart:collection';
import 'dart:convert';
import 'dart:io';

/// A small utility to augment swaggerApi.json by adding missing
/// operationId and modelId for each path+method entry.
///
/// Heuristics:
/// - operationId: lowerCamelCase, derived from Chinese summary using a small
///   zh->en dictionary. Fallbacks: use tags or sanitized path.
/// - modelId: PascalCase; prefer request body schema.title (trim suffixes like
///   ReqVO/RespVO/VO/DTO/Request/Response). If absent, derive from summary.
/// - Existing fields are preserved.
/// - Output is formatted with two-space indentation to match repository style.
Future<void> main(List<String> args) async {
  final String projectRoot = Directory.current.path;
  final File swaggerFile = File('$projectRoot/lib/swaggers/swaggerApi.json');
  if (!swaggerFile.existsSync()) {
    stderr.writeln('File not found: lib/swaggers/swaggerApi.json');
    exitCode = 2;
    return;
  }

  final String original = await swaggerFile.readAsString();
  Map<String, dynamic> doc;
  try {
    doc = json.decode(original) as Map<String, dynamic>;
  } catch (e) {
    stderr.writeln('Failed to parse JSON: $e');
    exitCode = 3;
    return;
  }

  if (!doc.containsKey('paths') || doc['paths'] is! Map) {
    stderr.writeln('Invalid swagger: missing paths');
    exitCode = 4;
    return;
  }

  final Map<String, dynamic> paths = (doc['paths'] as Map)
      .cast<String, dynamic>();

  int updatedCount = 0;
  // Collect all operations for de-dup later
  final List<_OpRef> allOps = [];
  for (final MapEntry<String, dynamic> pathEntry in paths.entries) {
    final String path = pathEntry.key;
    final dynamic methodsObj = pathEntry.value;
    if (methodsObj is! Map) continue;

    for (final MapEntry methodEntry in methodsObj.entries) {
      final String method = methodEntry.key.toString();
      final dynamic op = methodEntry.value;
      if (op is! Map) continue;

      final Map<String, dynamic> opMap = op.cast<String, dynamic>();

      final String? summary = _asString(opMap['summary']);
      final List<String> tags = _asStringList(opMap['tags']);

      // operationId
      if (opMap['operationId'] == null ||
          _isEmptyString(opMap['operationId'])) {
        final String generatedOperationId = _generateOperationId(
          summary,
          tags,
          path,
        );
        opMap['operationId'] = generatedOperationId;
        updatedCount++;
      }

      // modelId
      if (opMap['modelId'] == null || _isEmptyString(opMap['modelId'])) {
        final String generatedModelId = _generateModelId(
          opMap,
          summary,
          tags,
          path,
        );
        opMap['modelId'] = generatedModelId;
        updatedCount++;
      }

      methodsObj[method] = opMap; // assign back (defensive)

      allOps.add(_OpRef(path: path, method: method, opMap: opMap));
    }

    paths[path] = methodsObj; // assign back (defensive)
  }

  // Enforce global uniqueness for operationId and modelId
  final Set<String> usedOperationIds = {};
  final Set<String> usedModelIds = {};
  final Map<String, int> operationIdCounts = {};
  final Map<String, int> modelIdCounts = {};

  for (final _OpRef ref in allOps) {
    final String opId = _asString(ref.opMap['operationId'])!.trim();
    final String modelId = _asString(ref.opMap['modelId'])!.trim();
    operationIdCounts[opId] = (operationIdCounts[opId] ?? 0) + 1;
    modelIdCounts[modelId] = (modelIdCounts[modelId] ?? 0) + 1;
  }

  for (final _OpRef ref in allOps) {
    String opId = _asString(ref.opMap['operationId'])!.trim();
    String modelId = _asString(ref.opMap['modelId'])!.trim();

    // Make operationId unique
    if (!usedOperationIds.add(opId)) {
      final String base = opId;
      String proposal = _uniqueWithPath(
        base,
        ref.path,
        ref.method,
        usedOperationIds,
      );
      if (proposal != opId) {
        ref.opMap['operationId'] = proposal;
        opId = proposal;
        updatedCount++;
      }
    }

    // Make modelId unique
    if (!usedModelIds.add(modelId)) {
      final String base = modelId;
      final String? title = _extractRequestTitle(ref.opMap);
      String proposal = _uniqueWithTitleOrPath(
        base,
        title,
        ref.path,
        usedModelIds,
      );
      if (proposal != modelId) {
        ref.opMap['modelId'] = proposal;
        modelId = proposal;
        updatedCount++;
      }
    }
  }

  // Reorder keys so that modelId & operationId appear immediately after consumes
  for (final MapEntry<String, dynamic> pathEntry in paths.entries) {
    final dynamic methodsObj = pathEntry.value;
    if (methodsObj is! Map) continue;
    for (final MapEntry methodEntry in methodsObj.entries.toList()) {
      final dynamic op = methodEntry.value;
      if (op is! Map) continue;
      final Map<String, dynamic> opMap = op.cast<String, dynamic>();
      final Map<String, dynamic> reordered = _reorderOpMap(opMap);
      methodsObj[methodEntry.key] = reordered;
    }
  }

  // Write backup then file
  final File backup = File('$projectRoot/lib/swaggers/swaggerApi.backup.json');
  await backup.writeAsString(original);

  final encoder = const JsonEncoder.withIndent('  ');
  final String formatted = encoder.convert(doc);
  await swaggerFile.writeAsString(formatted);

  stdout.writeln('Augmentation done. Updated fields: $updatedCount');
}

bool _isEmptyString(Object? v) =>
    v == null || (v is String && v.trim().isEmpty);

String? _asString(Object? v) => v?.toString();

List<String> _asStringList(Object? v) {
  if (v is List) {
    return v
        .map((e) => e?.toString() ?? '')
        .where((e) => e.isNotEmpty)
        .toList();
  }
  return const [];
}

String _generateOperationId(
  String? summaryRaw,
  List<String> tags,
  String path,
) {
  final String summary = (summaryRaw ?? '').trim();
  // try summary first
  if (summary.isNotEmpty) {
    final _ActionNoun an = _parseActionAndNoun(summary);
    final String verb = an.verbEn ?? _guessVerbFromSummary(summary) ?? 'do';
    final String nounCamel =
        _mapNounToEnglishCamel(an.nounZh) ??
        _mapFromTags(tags) ??
        _pathToCamel(path);
    return _toLowerCamel('$verb ${_toPascal(nounCamel)}');
  }
  // tags
  final String? fromTags = _mapFromTags(tags);
  if (fromTags != null) {
    return _toLowerCamel('do ${_toPascal(fromTags)}');
  }
  // fallback path
  return _toLowerCamel('do ${_toPascal(_pathToCamel(path))}');
}

String _generateModelId(
  Map<String, dynamic> opMap,
  String? summaryRaw,
  List<String> tags,
  String path,
) {
  // Prefer request schema title
  final String? title = _extractRequestTitle(opMap);
  if (title != null && title.trim().isNotEmpty) {
    final String trimmed = _trimTypeSuffixes(title.trim());
    if (trimmed.isNotEmpty) return _toPascal(trimmed);
  }

  // derive from summary
  final String summary = (summaryRaw ?? '').trim();
  if (summary.isNotEmpty) {
    final _ActionNoun an = _parseActionAndNoun(summary);
    final String verb = an.verbEn ?? _guessVerbFromSummary(summary) ?? 'Do';
    final String noun =
        _mapNounToEnglishPascal(an.nounZh) ??
        _mapFromTagsPascal(tags) ??
        _toPascal(_pathToCamel(path));
    // Prefer Noun + Verb (PascalCase)
    return _toPascal('$noun $verb');
  }

  // tags fallback
  final String? fromTagsPascal = _mapFromTagsPascal(tags);
  if (fromTagsPascal != null) {
    return _toPascal('$fromTagsPascal Do');
  }

  return _toPascal('${_pathToCamel(path)} Do');
}

String? _extractRequestTitle(Map<String, dynamic> opMap) {
  final Object? parameters = opMap['parameters'];
  if (parameters is List) {
    for (final param in parameters) {
      if (param is Map) {
        final String? where = _asString(param['in']);
        if (where == 'body') {
          final Object? schema = param['schema'];
          if (schema is Map) {
            final String? title = _asString(schema['title']);
            if (title != null && title.isNotEmpty) return title;
          }
        }
      }
    }
  }
  return null;
}

String _trimTypeSuffixes(String name) {
  const List<String> suffixes = [
    'ReqVO',
    'RespVO',
    'Request',
    'Response',
    'VO',
    'DTO',
  ];
  String out = name;
  for (final s in suffixes) {
    if (out.endsWith(s)) {
      out = out.substring(0, out.length - s.length);
      break;
    }
  }
  return out;
}

class _ActionNoun {
  final String? verbEn;
  final String nounZh;

  _ActionNoun({required this.verbEn, required this.nounZh});
}

_ActionNoun _parseActionAndNoun(String summaryZh) {
  final Map<String, String> verbMap = {
    '删除': 'delete',
    '移除': 'delete',
    '新增': 'create',
    '添加': 'add',
    '创建': 'create',
    '修改': 'update',
    '更新': 'update',
    '查询': 'get',
    '获取': 'get',
    '查看': 'get',
    '详情': 'getDetail',
    '列表': 'list',
    '分页': 'page',
    '发送': 'send',
    '绑定': 'bind',
    '解绑': 'unbind',
    '上传': 'upload',
    '下载': 'download',
    '登录': 'login',
    '注册': 'register',
    '提交': 'submit',
    '审核': 'review',
    '申请': 'apply',
    '支付': 'pay',
    '还款': 'repay',
    '启用': 'enable',
    '禁用': 'disable',
    '重置': 'reset',
    '校验': 'validate',
    '验证': 'verify',
    '预览': 'preview',
    '导出': 'export',
    '导入': 'import',
    '同步': 'sync',
  };

  String noun = summaryZh;
  String? verb;
  for (final entry in verbMap.entries) {
    if (summaryZh.startsWith(entry.key)) {
      verb = entry.value;
      noun = summaryZh.substring(entry.key.length);
      break;
    }
  }
  noun = noun.replaceAll(RegExp(r'^[\s:：、，,的和与及-]+'), '');
  return _ActionNoun(verbEn: verb, nounZh: noun);
}

String? _guessVerbFromSummary(String summaryZh) {
  return _parseActionAndNoun(summaryZh).verbEn;
}

String? _mapFromTags(List<String> tags) {
  if (tags.isEmpty) return null;
  return _mapNounToEnglishCamel(tags.first);
}

String? _mapFromTagsPascal(List<String> tags) {
  final String? camel = _mapFromTags(tags);
  return camel == null ? null : _toPascal(camel);
}

String? _mapNounToEnglishCamel(String zh) {
  final String? pascal = _mapNounToEnglishPascal(zh);
  if (pascal == null) return null;
  return _toLowerCamel(pascal);
}

String? _mapNounToEnglishPascal(String zh) {
  if (zh.trim().isEmpty) return null;
  // Normalize common noise
  String cleaned = zh;
  for (final noise in ['我的', '信息', '相关', '管理', '中心']) {
    cleaned = cleaned.replaceAll(noise, '');
  }

  // Known noun mappings (expand as needed)
  final Map<String, String> nounMap = {
    '银行卡': 'BankCard',
    '银行': 'Bank',
    '卡': 'Card',
    '用户': 'User',
    '客户': 'Customer',
    '订单': 'Order',
    '商品': 'Product',
    '地址': 'Address',
    '渠道': 'Channel',
    '短信': 'Sms',
    '验证码': 'VerificationCode',
    '图片': 'Image',
    '文件': 'File',
    '额度': 'CreditLimit',
    '贷款': 'Loan',
    '合同': 'Contract',
    '资金': 'Fund',
    '账单明细': 'BillDetail',
    '账单': 'Bill',
    '还款计划': 'RepayPlan',
    '还款': 'Repay',
    '实名': 'RealName',
    '认证': 'Auth',
    '绑卡': 'BindCard',
    '列表': 'List',
    '状态': 'Status',
    '详情': 'Detail',
    '头像': 'Avatar',
    '渠道订单': 'ChannelOrder',
    '产品': 'Product',
    '工作': 'Work',
    '联系人': 'Contact',
    '基础信息': 'BasicInfo',
    '提交': 'Submit',
    '审核': 'Review',
  };

  // Try full-string mapping first
  if (nounMap.containsKey(cleaned)) return nounMap[cleaned]!;

  // Segment by common separators and map parts
  final List<String> parts = cleaned
      .split(RegExp(r'[\s、，,：:（）()[\]-]+'))
      .where((e) => e.isNotEmpty)
      .toList();
  final List<String> mapped = <String>[];
  for (final p in parts) {
    // longest match first
    String? best;
    for (final entry in nounMap.entries) {
      if (p.contains(entry.key)) {
        if (best == null || entry.key.length > best.length) {
          best = entry.key;
        }
      }
    }
    if (best != null) {
      mapped.add(nounMap[best]!);
    }
  }
  if (mapped.isNotEmpty) return mapped.map(_toPascal).join();

  // Fallback: sanitize ASCII from zh (use path fallback outside)
  return null;
}

String _pathToCamel(String path) {
  final String sanitized = path
      .replaceAll(RegExp(r'[^a-zA-Z0-9]+'), ' ')
      .trim();
  if (sanitized.isEmpty) return 'Path';
  return _toLowerCamel(sanitized);
}

String _toPascal(String input) {
  final parts = input
      .replaceAll(RegExp(r'[^a-zA-Z0-9]+'), ' ')
      .trim()
      .split(RegExp(r'\s+'))
      .where((e) => e.isNotEmpty)
      .toList();
  return parts
      .map((w) => w[0].toUpperCase() + (w.length > 1 ? w.substring(1) : ''))
      .join();
}

String _toLowerCamel(String input) {
  final pascal = _toPascal(input);
  if (pascal.isEmpty) return '';
  return pascal[0].toLowerCase() + pascal.substring(1);
}

class _OpRef {
  final String path;
  final String method;
  final Map<String, dynamic> opMap;

  _OpRef({required this.path, required this.method, required this.opMap});
}

String _uniqueWithPath(
  String base,
  String path,
  String method,
  Set<String> used,
) {
  // Try base + Pascal(Path) + Method
  final String suffix = _toPascal(_pathToCamel(path)) + _toPascal(method);
  String candidate = _toLowerCamel('$base $suffix');
  int counter = 2;
  while (used.contains(candidate)) {
    candidate = _toLowerCamel('$base $suffix $counter');
    counter++;
  }
  used.add(candidate);
  return candidate;
}

String _uniqueWithTitleOrPath(
  String base,
  String? title,
  String path,
  Set<String> used,
) {
  final String suffixSource = (title == null || title.trim().isEmpty)
      ? _toPascal(_pathToCamel(path))
      : _toPascal(_trimTypeSuffixes(title.trim()));
  String candidate = _toPascal('$base $suffixSource');
  int counter = 2;
  while (used.contains(candidate)) {
    candidate = _toPascal('$base $suffixSource $counter');
    counter++;
  }
  used.add(candidate);
  return candidate;
}

Map<String, dynamic> _reorderOpMap(Map<String, dynamic> original) {
  // Ensure LinkedHashMap for stable insertion order
  final LinkedHashMap<String, dynamic> result =
      LinkedHashMap<String, dynamic>();

  bool hasTags = original.containsKey('tags');
  bool hasSummary = original.containsKey('summary');
  bool hasConsumes = original.containsKey('consumes');

  // 1) Prepend anchors in order: tags -> summary -> consumes
  if (hasTags) {
    result['tags'] = original['tags'];
  }
  if (hasSummary) {
    result['summary'] = original['summary'];
  }
  if (hasConsumes) {
    result['consumes'] = original['consumes'];
  }

  // 2) Place modelId and operationId right after consumes (or after summary/tags if consumes missing)
  if (original.containsKey('modelId')) {
    result['modelId'] = original['modelId'];
  }
  if (original.containsKey('operationId')) {
    result['operationId'] = original['operationId'];
  }

  // 3) Common fields to follow
  const List<String> preferredTail = [
    'parameters',
    'responses',
    'produces',
    'security',
    'deprecated',
  ];
  for (final key in preferredTail) {
    if (original.containsKey(key) && !result.containsKey(key)) {
      result[key] = original[key];
    }
  }

  // 4) Append any remaining keys in their original encounter order
  for (final MapEntry entry in original.entries) {
    if (!result.containsKey(entry.key)) {
      result[entry.key] = entry.value;
    }
  }

  return result;
}
