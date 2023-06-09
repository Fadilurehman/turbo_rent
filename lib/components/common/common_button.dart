import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color color;
  final Widget child;
  const CommonButton({
    super.key,
    required this.onTap,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            const Size(
              200,
              45,
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(
            color,
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.green,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
        ),
        onPressed: onTap,
        child: child);
  }
}
