import 'dart:math' as math;

import 'package:flutter/material.dart';

/// 可定制、支持 step 的水平滑动条
class StepSlider extends StatefulWidget {
  final double min;
  final double max;
  final double value;
  final double step;
  final ValueChanged<double>? onChanged;
  final double height;
  final double trackHeight;
  final Color trackColor;
  final Color activeTrackColor;
  final Widget Function(BuildContext context, double value, bool isDragging)?
  thumbBuilder;

  const StepSlider({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    required this.step,
    this.onChanged,
    this.height = 48,
    this.trackHeight = 10,
    this.trackColor = const Color(0xFFE0E0E0),
    this.activeTrackColor = Colors.blue,
    this.thumbBuilder,
  }) :assert(step > 0);

  @override
  StepSliderState createState() => StepSliderState();
}

class StepSliderState extends State<StepSlider> {
  late double _value;
  bool _dragging = false;

  @override
  void initState() {
    super.initState();
    _value = _clampAndAlign(widget.value);
  }

  @override
  void didUpdateWidget(covariant StepSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 外部 value 更新时同步
    if (widget.value != oldWidget.value && !_dragging) {
      _value = _clampAndAlign(widget.value);
    }
  }

  double _clampAndAlign(double v) {
    final clamped = v.clamp(widget.min, widget.max);
    final steps = ((clamped - widget.min) / widget.step).round();
    return (widget.min + steps * widget.step)
        .clamp(widget.min, widget.max)
        .toDouble();
  }

  double _valueFromGlobalOffset(Offset global, RenderBox box) {
    final local = box.globalToLocal(global);
    final w = box.size.width;
    final dx = local.dx.clamp(0.0, w);
    final ratio = (dx / w).clamp(0.0, 1.0);
    final raw = widget.min + (widget.max - widget.min) * ratio;
    // 对齐到 step
    final steps = ((raw - widget.min) / widget.step).round();
    final aligned = (widget.min + steps * widget.step)
        .clamp(widget.min, widget.max)
        .toDouble();
    return aligned;
  }

  void _handleDragStart(DragStartDetails details, RenderBox box) {
    setState(() {
      _dragging = true;
    });
    final newV = _valueFromGlobalOffset(details.globalPosition, box);
    if (newV != _value) {
      setState(() => _value = newV);
      widget.onChanged?.call(_value);
    }
  }

  void _handleDragUpdate(DragUpdateDetails details, RenderBox box) {
    final newV = _valueFromGlobalOffset(details.globalPosition, box);
    if (newV != _value) {
      setState(() => _value = newV);
      widget.onChanged?.call(_value);
    }
  }

  void _handleDragEnd(DragEndDetails details) {
    setState(() {
      _dragging = false;
    });
  }

  void _handleTapDown(TapDownDetails details, RenderBox box) {
    final newV = _valueFromGlobalOffset(details.globalPosition, box);
    if (newV != _value) {
      setState(() => _value = newV);
      widget.onChanged?.call(_value);
    }
  }

  @override
  Widget build(BuildContext context) {
    // thumb 默认尺寸
    final thumbSize = 36.0;
    return SizedBox(
      height: widget.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final fullWidth = constraints.maxWidth;
          final ratio = ((_value - widget.min) / (widget.max - widget.min))
              .clamp(0.0, 1.0);
          final thumbLeft = ratio * fullWidth;

          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTapDown: (details) {
              final box = context.findRenderObject() as RenderBox;
              _handleTapDown(details, box);
            },
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // 轨道（背景）
                Positioned(
                  left: thumbSize / 2,
                  right: thumbSize / 2,
                  top: (widget.height - widget.trackHeight) / 2,
                  child: Container(
                    height: widget.trackHeight,
                    decoration: BoxDecoration(
                      color: widget.trackColor,
                      borderRadius: BorderRadius.circular(
                        widget.trackHeight / 2,
                      ),
                    ),
                  ),
                ),
                // 已激活轨道
                Positioned(
                  left: thumbSize / 2,
                  width: math.max(0, thumbLeft - thumbSize / 2),
                  top: (widget.height - widget.trackHeight) / 2,
                  child: Container(
                    height: widget.trackHeight,
                    decoration: BoxDecoration(
                      color: widget.activeTrackColor,
                      borderRadius: BorderRadius.circular(
                        widget.trackHeight / 2,
                      ),
                    ),
                  ),
                ),
                // thumb
                Positioned(
                  left: (thumbLeft - thumbSize / 2).clamp(
                    0.0,
                    fullWidth - thumbSize,
                  ),
                  top: (widget.height - thumbSize) / 2,
                  child: _buildDraggableThumb(thumbSize),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDraggableThumb(double size) {
    final thumb = widget.thumbBuilder != null
        ? widget.thumbBuilder!(context, _value, _dragging)
        : _defaultThumb(size, _dragging);

    // 加 GestureDetector 以支持拖动
    return Listener(
      behavior: HitTestBehavior.translucent,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onHorizontalDragStart: (details) {
          final box = context.findRenderObject() as RenderBox;
          _handleDragStart(details, box);
        },
        onHorizontalDragUpdate: (details) {
          final box = context.findRenderObject() as RenderBox;
          _handleDragUpdate(details, box);
        },
        onHorizontalDragEnd: _handleDragEnd,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(child: thumb),
        ),
      ),
    );
  }

  Widget _defaultThumb(double size, bool dragging) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: dragging ? widget.activeTrackColor : Colors.white,
        border: Border.all(color: widget.activeTrackColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
