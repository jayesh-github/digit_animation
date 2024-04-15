import 'package:animated_digit/animated_digit.dart';
import 'package:digit_animation/custom_card.dart';
import 'package:flutter/material.dart';

class OverviewCard extends StatelessWidget {
  final List<Color> gradiantColors;
  final String count;
  final String title;
  final Color textShadowColor;
  final Color boxShadowColor;
  final double height;
  final EdgeInsetsGeometry padding;
  final double countFontSize;
  final double titleFontSize;
  final double spaceBetweenCountAndTitle;

  const OverviewCard({
    Key? key,
    required this.gradiantColors,
    required this.count,
    required this.title,
    required this.textShadowColor,
    required this.boxShadowColor,
    this.height = 150,
    this.padding = const EdgeInsets.all(24.0),
    this.countFontSize = 50,
    this.titleFontSize = 24,
    this.spaceBetweenCountAndTitle = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimatedDigitController controller =
        AnimatedDigitController(int.parse(count));
    return CustomCard(
      cardBackground: Colors.blue,
      height: height,
      boxShadow: BoxShadow(
        color: boxShadowColor,
        blurRadius: 10,
        offset: const Offset(0, 6),
      ),
      gradient: LinearGradient(
        colors: gradiantColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      constraints: const BoxConstraints(minWidth: 300),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   count,
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontWeight: FontWeight.w500,
            //     fontSize: countFontSize,
            //   ),
            // ),
            AnimatedDigitWidget(
              controller: controller,
              valueColors: [
                ValueColor(
                    condition: () {
                      if (int.parse(count) != null) {
                        return true;
                      } else {
                        return false;
                      }
                    },
                    color: Colors.white)
              ],
              autoSize: true,
              animateAutoSize: true,
              boxDecoration: null,
              key: const Key("ads"),
              value: int.parse(count),
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: countFontSize,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              curve: Curves.easeOutCubic,
              duration: const Duration(milliseconds: 400),
              enableSeparator: true,
              separateSymbol: ",",
              fractionDigits: 0,
            ),
            SizedBox(
              height: spaceBetweenCountAndTitle,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: titleFontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
