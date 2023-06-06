import 'package:flutter/material.dart';

class SpaceWH extends StatelessWidget {
  final double? width;
  final double? height;
  const SpaceWH({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 0.0,
      width: width ?? 0.0,
    );
  }
}
