import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/pages/submit/pick_date_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_day_dialog.dart';
import 'package:flutter_echo/pages/submit/pick_item_dialog.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepSelectField extends StatefulWidget {
  final Future Function() onValueChange;
  final String? value;
  final String hintText;
  final String errorText;
  final bool isError;

  const StepSelectField({
    super.key,
    required this.onValueChange,
    required this.value,
    required this.hintText,
    required this.errorText,
    required this.isError,
  });

  factory StepSelectField.pickItem(
    BuildContext context, {
    required List<StepItem>? items,
    required StepItem? pickedItem,
    required Function(StepItem) onValueChange,
    required String hintText,
    String errorText = 'Por favor seleccione',
    bool isError = false,
  }) => StepSelectField(
    value: pickedItem?.value,
    onValueChange: () async {
      final result = await PickItemDialog.show<StepItem>(
        context,
        items: items,
        pickedItem: pickedItem,
        showItem: (item) => item.value,
        title: hintText,
      );
      if (result != null) onValueChange(result);
    },
    hintText: hintText,
    errorText: errorText,
    isError: isError,
  );

  factory StepSelectField.pickArea(
    BuildContext context, {
    required List<String>? items,
    required String? pickedItem,
    required Function(String) onValueChange,
    required String hintText,
    String errorText = 'Por favor seleccione',
    bool isError = false,
  }) => StepSelectField(
    value: pickedItem,
    onValueChange: () async {
      final result = await PickItemDialog.show<String>(
        context,
        items: items,
        pickedItem: pickedItem,
        showItem: (item) => item,
        title: hintText,
      );
      if (result != null) onValueChange(result);
    },
    hintText: hintText,
    errorText: errorText,
    isError: isError,
  );

  factory StepSelectField.pickDate(
    BuildContext context, {
    required DateTime? pickedDate,
    required Function(DateTime) onValueChange,
    required String hintText,
    String errorText = 'Por favor seleccione',
    bool isError = false,
  }) => StepSelectField(
    value: pickedDate?.showDate,
    onValueChange: () async {
      final result = await PickDateDialog.show(context, title: hintText);
      if (result != null) onValueChange(result);
    },
    hintText: hintText,
    errorText: errorText,
    isError: isError,
  );

  factory StepSelectField.pickDay(
    BuildContext context, {
    required int? pickedDay,
    required Function(int) onValueChange,
    required String hintText,
    String errorText = 'Por favor seleccione',
    bool isError = false,
  }) => StepSelectField(
    value: pickedDay?.toString(),
    onValueChange: () async {
      final result = await PickDayDialog.show(context, title: hintText);
      if (result != null) onValueChange(result);
    },
    hintText: hintText,
    errorText: errorText,
    isError: isError,
  );

  @override
  State<StepSelectField> createState() => _StepSelectFieldState();
}

class _StepSelectFieldState extends State<StepSelectField> {
  bool _isChoosing = false;

  void _onFocusChanged(bool value) {
    if (_isChoosing != value) {
      setState(() => _isChoosing = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () async {
            _onFocusChanged(true);
            await widget.onValueChange();
            _onFocusChanged(false);
          },
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: 60.h),
            padding: EdgeInsets.only(left: 12.w, right: 4.w),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(
                color: _isChoosing
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
                  child: widget.value != null
                      ? _buildFieldValue()
                      : Text(
                          widget.hintText,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: NowColors.c0xFF77797B,
                            height: 24 / 16,
                          ),
                        ),
                ),
                Icon(
                  Icons.arrow_right_rounded,
                  color: NowColors.c0xFFB0B1B2,
                  size: 36,
                ),
              ],
            ),
          ),
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

  Widget _buildFieldValue() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 9.h),
        Text(
          widget.hintText,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: NowColors.c0xFF77797B,
            height: 16 / 12,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          widget.value!,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: NowColors.c0xFF1C1F23,
            height: 22 / 16,
          ),
        ),
        SizedBox(height: 9.h),
      ],
    );
  }
}
