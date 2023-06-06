import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class CommonSnackBAr {
  static snackBar({
    required BuildContext context,
    required String data,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: Text(
          data,
          style: const TextStyle(color: kBlack),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        padding: const EdgeInsets.all(15),
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        clipBehavior: Clip.hardEdge,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
