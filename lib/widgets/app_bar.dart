import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppBarCustom extends StatelessWidget {
  const AppBarCustom({
    Key? key,
    required this.title,
    required this.bgColor,
    this.elevation = 0,
    this.actions,
  }) : super(key: key);
  final String title;
  final Color bgColor;
  final double? elevation;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: bgColor,
      elevation: elevation,
      actions: actions,
    );
  }
}
