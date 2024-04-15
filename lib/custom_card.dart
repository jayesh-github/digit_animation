import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color cardBackground;
  final Widget child;
  final bool showShadow;
  final BoxConstraints? constraints;
  final BoxShadow? boxShadow;
  final Gradient? gradient;

  const CustomCard({
    Key? key,
    this.height,
    this.cardBackground = Colors.white,
    required this.child,
    this.showShadow = true,
    this.width,
    this.constraints,
    this.boxShadow,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      constraints: constraints,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: cardBackground,
        gradient: gradient,
        boxShadow: showShadow
            ? [
                boxShadow ??
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
