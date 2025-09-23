import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';
import 'package:flutter_echo/models/common_model.dart';
import 'package:flutter_echo/providers/feedback_provider.dart';
import 'package:flutter_echo/ui/widget_helper.dart';
import 'package:flutter_echo/ui/widgets/top_bar.dart';
import 'package:flutter_echo/utils/common_utils.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _controller = TextEditingController();
  List<DictItem>? _stepItems;
  List<bool>? _selected;
  bool _selectedOther = false;

  int get stepLength {
    final items = _stepItems;
    return items == null ? 2 : items.length + 2;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final feedbackModel = context.read<FeedbackModel>();
      final dict = await feedbackModel.getDictionary();
      setState(() {
        _stepItems = dict;
        _selected = _stepItems?.map((v) => false).toList();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitFeedback(BuildContext context) async {
    final types = [];
    final items = _stepItems;
    if (items != null) {
      for (int i = 0; i < items.length; i++) {
        if (_selected?[i] == true) types.add(items[i].key);
      }
    }
    if (types.isEmpty && !_selectedOther) {
      toast(
        'Por favor, seleccione sus sugerencias y quejas. Nos pondremos en contacto con usted lo antes posible',
      );
      return;
    }
    if (_selectedOther && _controller.text.isEmpty) {
      toast('Por favor ingrese otro motivo');
      return;
    }
    final feedbackModel = context.read<FeedbackModel>();
    final result = await feedbackModel.submitFeedback(
      type: types.join(','),
      content: _selectedOther == true ? _controller.text : null,
    );
    if (result == true && context.mounted) {
      toast('¡Envío exitoso!');
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NowColors.c0xFFF3F3F5,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          WidgetHelper.buildTopGradient(context: context, height: 55.h),
          SafeArea(
            child: Column(
              children: [
                EchoTopBar(title: 'Comentarios'),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: stepLength,
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 14.h,
                    ),
                    separatorBuilder: (context, _) => SizedBox(height: 12.h),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Text(
                            'Por favor, seleccione sus sugerencias y quejas. Nos pondremos en contacto con usted lo antes posible',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: NowColors.c0xFF494C4F,
                              height: 20 / 13,
                            ),
                          ),
                        );
                      }
                      if (index >= stepLength - 1) return _buildOtherItem();
                      return _buildPickItem(index - 1);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: WidgetHelper.buildBottomButton(
        text: 'Enviar',
        onPressed: () => _submitFeedback(context),
      ),
    );
  }

  Widget _buildPickItem(int index) {
    final selected = _selected?[index];
    return InkWell(
      onTap: () => setState(() {
        _selected?[index] = selected != true;
      }),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Row(
          children: [
            Image.asset(
              selected == true ? Drawable.iconSelectOn : Drawable.iconSelectOff,
              width: 22.r,
              height: 22.r,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                _stepItems?[index].value ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: selected == true
                      ? FontWeight.w500
                      : FontWeight.w400,
                  color: NowColors.c0xFF1C1F23,
                  height: 22 / 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherItem() {
    return InkWell(
      onTap: () => setState(() => _selectedOther = !_selectedOther),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: NowStyles.cardShadows,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  _selectedOther == true
                      ? Drawable.iconSelectOn
                      : Drawable.iconSelectOff,
                  width: 22.r,
                  height: 22.r,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    'Otros comentarios',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: _selectedOther == true
                          ? FontWeight.w500
                          : FontWeight.w400,
                      color: NowColors.c0xFF1C1F23,
                      height: 22 / 14,
                    ),
                  ),
                ),
              ],
            ),
            if (_selectedOther)
              Container(
                margin: EdgeInsets.only(top: 13.h),
                constraints: BoxConstraints(minHeight: 80.h),
                decoration: BoxDecoration(
                  color: NowColors.c0xFFF3F3F5,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: TextField(
                  autofocus: false,
                  controller: _controller,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
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
                    hint: Text(
                      'Por favor escribe',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: NowColors.c0xFFB0B1B2,
                        height: 22 / 14,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      left: 12.w,
                      right: 12.w,
                      bottom: 8.h,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
