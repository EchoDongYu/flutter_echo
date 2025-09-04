import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/common/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepEmailField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String errorText;
  final bool isError;

  const StepEmailField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.errorText,
    required this.isError,
  });

  @override
  State<StepEmailField> createState() => _StepEmailFieldState();
}

class _StepEmailFieldState extends State<StepEmailField> {
  FocusNode? _focusNode;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _focusNode = null;
    super.dispose();
  }

  /// 焦点变化监听
  void _onFocusChanged() {
    final expanded = widget.controller.text.isNotEmpty || _focusNode?.hasFocus == true;
    if (_isExpanded != expanded) {
      setState(() {
        _isExpanded = expanded;
      });
    }
  }

  /// 从当前输入生成候选项
  Iterable<String> _optionsBuilder(TextEditingValue text) {
    final value = text.text;
    final atIndex = value.indexOf('@');
    // 未输入 @ 或 @ 在开头（还没开始输入域）
    if (atIndex < 1) return const Iterable<String>.empty();

    final local = value.substring(0, atIndex); // name
    final domainPart = value.substring(atIndex + 1); // 已输入的域前缀

    // 如果还没输入域前缀，就展示全部
    final source = domainPart.isEmpty
        ? AppConst.emailDomains
        : AppConst.emailDomains.where((d) => d.startsWith(domainPart.toLowerCase()));
    // 生成完整的 email 作为候选，便于直接选中即完成
    return source.map((d) => '$local@$d');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            if (!_isExpanded)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Text(
                  widget.hintText,
                  style: TextStyle(
                    fontSize: widget.hintText.length > 30 ? 14.sp : 16.sp,
                    fontWeight: FontWeight.w400,
                    color: NowColors.c0xFF77797B,
                    height: 24 / 16,
                  ),
                ),
              ),
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: 62.h),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                border: Border.all(
                  color: _focusNode?.hasFocus == true
                      ? NowColors.c0xFF3288F1
                      : widget.isError
                      ? NowColors.c0xFFFB4F34
                      : NowColors.c0xFFD8D8D8,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // labelText
                        if (_isExpanded)
                          Padding(
                            padding: EdgeInsets.only(left: 12.w, top: 8.h, bottom: 4.h),
                            child: Text(
                              widget.hintText,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: NowColors.c0xFF77797B,
                                height: 16 / 12,
                              ),
                            ),
                          ),
                        _buildAutocomplete(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        if (widget.isError)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Text(
              widget.errorText,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: NowColors.c0xFFFB4F34,
                height: 16 / 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAutocomplete(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: _optionsBuilder,
      fieldViewBuilder: (context, textController, focusNode, onSubmitted) {
        // 内部 controller 与我们持有的保持同步
        if (textController != widget.controller) {
          textController.text = widget.controller.text;
          textController.selection = widget.controller.selection;
          widget.controller.addListener(() {
            if (textController.text != widget.controller.text) {
              textController.value = widget.controller.value;
            }
          });
          textController.addListener(() {
            if (widget.controller.text != textController.text) {
              widget.controller.value = textController.value;
            }
          });
          _focusNode = focusNode;
          _focusNode?.addListener(_onFocusChanged);
        }

        return TextField(
          autofocus: false,
          focusNode: focusNode,
          controller: textController,
          keyboardType: TextInputType.emailAddress,
          autofillHints: const [AutofillHints.email],
          maxLines: 1,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: NowColors.c0xFF1C1F23,
            height: 22 / 16,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            counterText: '',
            isCollapsed: _isExpanded,
            contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 8.h),
          ),
          onSubmitted: (_) => onSubmitted(),
        );
      },
      optionsViewBuilder: (context, onSelected, options) {
        final list = options.toList(growable: false);
        if (list.isEmpty) return const SizedBox.shrink();
        return Card(
          surfaceTintColor: NowColors.c0xFFEFF7FF,
          elevation: 3,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: list.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final option = list[index];
              return InkWell(
                onTap: () => onSelected(option),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: NowColors.c0xFF1C1F23,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      onSelected: (selected) {
        // 选择结果写入，并把光标移到末尾
        widget.controller.text = selected;
        widget.controller.selection = TextSelection.collapsed(
          offset: widget.controller.text.length,
        );
        FocusScope.of(context).unfocus();
      },
    );
  }
}
