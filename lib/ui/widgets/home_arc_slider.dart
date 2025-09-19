import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';

class ArcSlider extends StatefulWidget {
  final double min;
  final double max;
  final double step;
  final double value;
  final double size;
  final ValueChanged<double> onChanged;

  const ArcSlider({
    super.key,
    required this.min,
    required this.max,
    required this.step,
    required this.value,
    required this.size,
    required this.onChanged,
  });

  @override
  State<ArcSlider> createState() => _ArcSliderState();
}

class _ArcSliderState extends State<ArcSlider> {
  late double currentValue;
  final double thickness = 24;
  bool _dragging = false;

  @override
  void initState() {
    super.initState();
    currentValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant ArcSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != currentValue) {
      currentValue = widget.value;
    }
  }

  double valueToAngle(double v) {
    final ratio = (v - widget.min) / (widget.max - widget.min);
    return ratio.clamp(0.0, 1.0) * pi; // 0=左端(π)，π=右端(0)
  }

  double angleToValue(double angle) {
    final ratio = (angle / pi).clamp(0.0, 1.0);
    return widget.min + ratio * (widget.max - widget.min);
  }

  double _pointToAngle(Offset pos, Offset center) {
    final dx = pos.dx - center.dx;
    final dy = pos.dy - center.dy;
    double angle = atan2(dy, dx); // [-π, π]
    if (angle < 0) angle += 2 * pi;
    // 上半圆：π 到 2π，不取下半圆
    if (angle < pi) angle = pi;
    if (angle > 2 * pi) angle = 2 * pi;
    return angle - pi; // 映射到 [0, π]
  }

  void _handleDrag(Offset localPos, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final dx = localPos.dx - center.dx;
    final dy = localPos.dy - center.dy;
    final dist = sqrt(dx * dx + dy * dy);

    final ringRadius = radius - thickness / 2;
    if (dist < ringRadius - thickness || dist > ringRadius + thickness) return;
    if (dy > 0) return; // 下半圆忽略

    final angle = _pointToAngle(localPos, center);
    double rawValue = angleToValue(angle);
    double steps = ((rawValue - widget.min) / widget.step).roundToDouble();
    double snapped = (widget.min + steps * widget.step).clamp(
      widget.min,
      widget.max,
    );

    setState(() => currentValue = snapped);
    widget.onChanged(currentValue);
  }

  void _setByStep(int dir) {
    double newValue = (currentValue + dir * widget.step).clamp(
      widget.min,
      widget.max,
    );
    double steps = ((newValue - widget.min) / widget.step).roundToDouble();
    double snapped = (widget.min + steps * widget.step).clamp(
      widget.min,
      widget.max,
    );
    setState(() => currentValue = snapped);
    widget.onChanged(currentValue);
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.size / 2;
    final height = radius; // 半圆高度 = 半径
    return SizedBox(
      width: widget.size,
      child: Listener(
        onPointerDown: (_) => setState(() => _dragging = true),
        onPointerUp: (_) => setState(() => _dragging = false),
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) => _dragging,
          child: GestureDetector(
            onPanDown: (details) {
              final local = (context.findRenderObject() as RenderBox)
                  .globalToLocal(details.globalPosition);
              _handleDrag(local, Size(widget.size, height));
            },
            onPanUpdate: (details) {
              final local = (context.findRenderObject() as RenderBox)
                  .globalToLocal(details.globalPosition);
              _handleDrag(local, Size(widget.size, height));
            },
            onPanEnd: (_) => setState(() => _dragging = false),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    CustomPaint(
                      size: Size(widget.size * 0.96, height),
                      painter: _ArcPainter(
                        thickness: thickness,
                        angle: valueToAngle(currentValue),
                        backgroundColor: Colors.grey.shade300,
                        progressColor: NowColors.c0xFF3288F1,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _IncDecButton(
                          icon: Icons.remove_rounded,
                          onTap: () => _setByStep(-1),
                        ),
                        _IncDecButton(
                          icon: Icons.add_rounded,
                          onTap: () => _setByStep(1),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Monto del préstamo (Q)',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: NowColors.c0xFF1C1F23,
                        height: 22 / 14,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      currentValue.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.w700,
                        color: NowColors.c0xFF1C1F23,
                        height: 45 / 45,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double angle;
  final double thickness;
  final Color backgroundColor;
  final Color progressColor;

  _ArcPainter({
    required this.angle,
    required this.thickness,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final rect = Rect.fromCircle(
      center: center,
      radius: radius - thickness / 2,
    );

    final bgPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    final progPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..strokeCap = StrokeCap.round;

    // 上半圆背景
    canvas.drawArc(rect, -pi, pi, false, bgPaint);
    // 进度弧
    canvas.drawArc(rect, -pi, angle, false, progPaint);

    // thumb
    final thumbAngle = -pi + angle;
    final thumbR = radius - thickness / 2;
    final x = center.dx + thumbR * cos(thumbAngle);
    final y = center.dy + thumbR * sin(thumbAngle);

    final outer = Paint()..color = Colors.white;
    final border = Paint()
      ..color = const Color(0x1F000000)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawCircle(Offset(x, y), 18, outer);
    canvas.drawCircle(Offset(x, y), 18, border);
    canvas.drawCircle(Offset(x, y), 12, Paint()..color = progressColor);
  }

  @override
  bool shouldRepaint(covariant _ArcPainter oldDelegate) =>
      oldDelegate.angle != angle;
}

class _IncDecButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IncDecButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: NowColors.c0xFF1C1F23),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(width: 45, height: 45, child: Icon(icon, size: 23)),
      ),
    );
  }
}
