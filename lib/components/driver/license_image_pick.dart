import 'package:flutter/material.dart';
import 'package:turbos_rent/utils/colors.dart';

class LicenseImagePick extends StatelessWidget {
  const LicenseImagePick({
    super.key,
    required this.size,
    required this.childs,
    required this.onTap,
    required this.borderClr,
  });
  final Size size;
  final Widget childs;
  final GestureTapCallback onTap;
  final Color borderClr;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: size.width * 0.8,
            height: size.width * 0.5,
            decoration: BoxDecoration(
              border: Border.all(
                width: 4,
                color: borderClr,
              ),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.1),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: childs,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 4,
                  color: kwhite,
                ),
                color: maincolor,
              ),
              child: GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.add_a_photo,
                  color: kwhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
