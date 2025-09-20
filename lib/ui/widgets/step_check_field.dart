import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepCheckField extends StatelessWidget {
  final String? value;
  final List<String> items;
  final Function(String) onValueChange;
  final String hintText;
  final String errorText;
  final bool isError;

  const StepCheckField({
    super.key,
    required this.value,
    required this.items,
    required this.onValueChange,
    required this.hintText,
    required this.errorText,
    required this.isError,
  });

  factory StepCheckField.pickItem(
    BuildContext context, {
    required List<StepItem>? items,
    required StepItem? pickedItem,
    required Function(StepItem) onValueChange,
    required String hintText,
    String errorText = 'Por favor seleccione',
    bool isError = false,
  }) => StepCheckField(
    value: pickedItem?.value,
    onValueChange: (value) async {
      final result = items?.firstWhereOrNull((it) => it.value == value);
      if (result != null) onValueChange(result);
    },
    items: items?.reversed.map((it) => it.value).toList() ?? List.empty(),
    hintText: hintText,
    errorText: errorText,
    isError: isError,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 60.h),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(
              color: isError ? NowColors.c0xFFFB4F34 : NowColors.c0xFFD8D8D8,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Text(
                hintText,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: NowColors.c0xFF77797B,
                  height: 24 / 16,
                ),
              ),
              Expanded(
                child: Container(
                  height: 60.h,
                  alignment: Alignment.centerRight,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    reverse: true,
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                    itemBuilder: (context, index) {
                      final bool selected = items[index] == value;
                      return RawChip(
                        label: Text(
                          items[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: selected
                                ? Colors.white
                                : NowColors.c0xFF494C4F,
                          ),
                        ),
                        selected: selected,
                        onSelected: (value) {
                          if (value) onValueChange(items[index]);
                        },
                        showCheckmark: false,
                        backgroundColor: Colors.white,
                        selectedColor: NowColors.c0xFF3288F1,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        side: BorderSide(
                          color: selected
                              ? Colors.transparent
                              : NowColors.c0xFF77797B,
                          width: 1.w,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isError)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Text(
              errorText,
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
}
