import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';

class WeatherCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final Color? shadowColor;
  final double? elevation;
  final ShapeBorder? shape;
  final VoidCallback? onPress;
  final bool? isSelected;
  final EdgeInsetsGeometry? cardMargin;



  const WeatherCard({super.key, this.child, this.shadowColor, this.elevation, this.shape, this.onPress, this.isSelected, this.color, this.cardMargin});

  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: cardMargin,
        color: color,
        shadowColor: shadowColor,
        elevation: elevation,
        shape: shape,
        child: child,
    );
  }
}
