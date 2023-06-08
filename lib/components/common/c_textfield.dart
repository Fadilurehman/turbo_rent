import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbo_rent/utils/colors.dart';
import 'package:turbo_rent/utils/textstyle.dart';
import 'package:turbo_rent/view_model/login_view_model.dart';

TextEditingController _passController = TextEditingController();
TextEditingController get passController => _passController;

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyType;
  final bool isPassword;
  final bool isEmail;
  final bool isPhone;
  final bool isUser;
  final bool isObs; //OBSCURE PASSWORD
  final Size size;
  final dynamic prefixIcon;
  const CommonTextField({
    super.key,
    required this.prefixIcon,
    required this.controller,
    required this.hintText,
    required this.keyType,
    required this.size,
    this.isPassword = false,
    this.isEmail = false,
    this.isPhone = false,
    this.isUser = false,
    this.isObs = false,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginViewModel>().passwordVisibility;
    return TextFormField(
      controller: controller,
      keyboardType: keyType,
      validator: (value) {
        if (isUser) {
          if (value == null || value.isEmpty) {
            return "Username is required";
          }
        }
        if (isPhone) {
          if (value == null || value.isEmpty) {
            return "Phonenumber is required";
          } else if (value.length != 10) {
            return "Enter a valid Phonenumber";
          }
        }
        if (isPassword) {
          RegExp isUppercase = RegExp(r'^(?=.*?[A-Z])');
          RegExp islowercase = RegExp(r'^(?=.*?[a-z])');
          RegExp isOnenumber = RegExp(r'^(?=.*?[0-9])');
          RegExp islength8 = RegExp(r'^.{8,}');
          if (value == null || value.isEmpty) {
            return "Password is required";
          } else if (!islength8.hasMatch(value)) {
            return "Password must be 8 or more characters";
          } else if (!isUppercase.hasMatch(value)) {
            return "Password must contain atleast one\nUppercase";
          } else if (!islowercase.hasMatch(value)) {
            return "Password must contain atleast one\nlowercase";
          } else if (!isOnenumber.hasMatch(value)) {
            return "Password must contain atleast\none number";
          }
        }

        if (isEmail) {
          if (value != null && !EmailValidator.validate(value)) {
            return "Enter valid email";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 198, 204, 223),
        filled: true,
        prefixIconColor: kBlack,
        prefixIcon: prefixIcon,
        suffixIconColor: kBlack,
        suffixIcon: isPassword
            ? IconButton(
                splashRadius: 4,
                onPressed: () {
                  context.read<LoginViewModel>().showPassword();
                },
                icon: provider
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              )
            : const SizedBox(),
        counterStyle: const TextStyle(color: kBlack),
        hintText: hintText,
        hintStyle: hintStyle,
        border: OutlineInputBorder(
          // borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(
        fontSize: size.width * 0.045,
        color: kBlack,
        fontWeight: FontWeight.bold,
      ),
      obscureText: isPassword ? provider : false,
    );
  }
}
