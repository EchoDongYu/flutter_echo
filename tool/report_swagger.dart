import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  final File f = File('lib/swaggers/swaggerApi.json');
  if (!f.existsSync()) {
    stderr.writeln('File not found: lib/swaggers/swaggerApi.json');
    exit(2);
  }
  final Map<String, dynamic> doc =
      json.decode(await f.readAsString()) as Map<String, dynamic>;
  final Map<String, dynamic> paths = (doc['paths'] as Map)
      .cast<String, dynamic>();

  final Set<String> httpMethods = {
    'get',
    'post',
    'put',
    'delete',
    'patch',
    'options',
    'head',
  };
  int totalOps = 0;
  int missingOpId = 0;
  int missingModelId = 0;
  final List<String> missingOpIdList = [];
  final List<String> missingModelIdList = [];
  final Map<String, int> opIdCount = {};
  final Map<String, int> modelIdCount = {};

  for (final MapEntry<String, dynamic> pathEntry in paths.entries) {
    final String path = pathEntry.key;
    final dynamic methods = pathEntry.value;
    if (methods is! Map) continue;
    for (final MapEntry e in methods.entries) {
      final String method = e.key.toString().toLowerCase();
      if (!httpMethods.contains(method)) continue;
      final Map<String, dynamic> op = (e.value as Map).cast<String, dynamic>();
      totalOps++;
      if (!(op.containsKey('operationId')) ||
          (op['operationId']?.toString().trim().isEmpty ?? true)) {
        missingOpId++;
        missingOpIdList.add('$method $path');
      }
      final String opId = (op['operationId']?.toString().trim() ?? '');
      if (opId.isNotEmpty) {
        opIdCount[opId] = (opIdCount[opId] ?? 0) + 1;
      }
      if (!(op.containsKey('modelId')) ||
          (op['modelId']?.toString().trim().isEmpty ?? true)) {
        missingModelId++;
        missingModelIdList.add('$method $path');
      }
      final String modelId = (op['modelId']?.toString().trim() ?? '');
      if (modelId.isNotEmpty) {
        modelIdCount[modelId] = (modelIdCount[modelId] ?? 0) + 1;
      }
    }
  }

  stdout.writeln('Total operations: $totalOps');
  stdout.writeln('Missing operationId: $missingOpId');
  stdout.writeln('Missing modelId: $missingModelId');
  final duplicatedOpIds = opIdCount.entries.where((e) => e.value > 1).toList();
  final duplicatedModelIds = modelIdCount.entries
      .where((e) => e.value > 1)
      .toList();
  stdout.writeln('Duplicated operationId count: ${duplicatedOpIds.length}');
  stdout.writeln('Duplicated modelId count: ${duplicatedModelIds.length}');
  if (duplicatedOpIds.isNotEmpty) {
    stdout.writeln('Sample duplicated operationId:');
    for (final e in duplicatedOpIds.take(10)) {
      stdout.writeln('  - ${e.key} (${e.value}x)');
    }
  }
  if (duplicatedModelIds.isNotEmpty) {
    stdout.writeln('Sample duplicated modelId:');
    for (final e in duplicatedModelIds.take(10)) {
      stdout.writeln('  - ${e.key} (${e.value}x)');
    }
  }
  if (missingOpIdList.isNotEmpty) {
    stdout.writeln('Sample missing operationId:');
    for (final s in missingOpIdList.take(10)) {
      stdout.writeln('  - $s');
    }
  }
  if (missingModelIdList.isNotEmpty) {
    stdout.writeln('Sample missing modelId:');
    for (final s in missingModelIdList.take(10)) {
      stdout.writeln('  - $s');
    }
  }
}
