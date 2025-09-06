import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_echo/common/app_theme.dart';

class CountdownWidget extends StatefulWidget {
  final Duration duration;

  const CountdownWidget({super.key, required this.duration});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  late Duration _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.duration;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining.inSeconds <= 0) {
        timer.cancel();
      } else {
        setState(() => _remaining -= const Duration(seconds: 1));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  /// 格式化为 mm:ss
  List<String> _timeParts() {
    final minutes = _remaining.inMinutes.toString().padLeft(2, '0');
    final seconds = (_remaining.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds'.split('');
  }

  @override
  Widget build(BuildContext context) {
    final parts = _timeParts();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: parts.map((char) {
        if (char == ":") {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Text(
              ":",
              style: const TextStyle(
                fontSize: 13,
                color: NowColors.c0xFFFF9817,
                fontWeight: FontWeight.bold,
                height: 20 / 13,
              ),
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.5),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
            decoration: BoxDecoration(
              color: NowColors.c0xFFFF9817,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              char,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }
      }).toList(),
    );
  }
}
