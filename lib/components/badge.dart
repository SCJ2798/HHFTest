import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Badge extends StatelessWidget {
  int count;
  Widget child;
  Badge({
    Key? key,
    required this.count,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(14),
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Center(
              child: Text(
                "$count",
                style: const TextStyle(color: Colors.white, fontSize: 8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
