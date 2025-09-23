
import 'package:flutter/material.dart';
import 'package:flutter_echo/utils/drawable_utils.dart';

class RotatingBorder extends StatelessWidget {
  final AnimationController controller;
  final double size;
  final double strokeWidth;

  const RotatingBorder({
    super.key,
    required this.controller,
    required this.size,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: controller,
      child: SizedBox(
        width: size,
        height: size,
        child: Image.asset(Drawable.iconCirculate),
      ),
    );
  }
}

class RotatingBorderBox extends StatefulWidget {
  final double borderSize;
  final double strokeWidth;
  final Widget child;

  const RotatingBorderBox({
    super.key,
    required this.child,
    this.borderSize = 260,
    this.strokeWidth = 4,
  });

  @override
  State<RotatingBorderBox> createState() => _RotatingBorderBoxState();
}

class _RotatingBorderBoxState extends State<RotatingBorderBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            width: widget.borderSize,
            height: widget.borderSize,
            child: widget.child,
          ),
        ),
        SizedBox(
          width: widget.borderSize + widget.strokeWidth * 6,
          height: widget.borderSize + widget.strokeWidth * 6,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return RotatingBorder(
                controller: _animationController,
                size: widget.borderSize + widget.strokeWidth * 2,
                strokeWidth: widget.strokeWidth,
              );
            },
          ),
        ),
      ],
    );
  }
}
