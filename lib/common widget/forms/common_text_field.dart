import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CommonTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final IconData? suffixIcon;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final Iterable<String>? autofillHints;

  const CommonTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.textInputAction,
    required this.validator,
     this.autofillHints,
    this.focusNode,
    this.suffixIcon,
    this.prefixIcon,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(), style: TextStyle(color: AppColors.primary)),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: TextFormField(
            autofillHints: autofillHints,
            validator: validator,
            controller: controller,
            textInputAction: textInputAction,
            focusNode: focusNode,
            onTapOutside: (_){
              FocusManager.instance.primaryFocus!.unfocus();
            },
            decoration: InputDecoration(
              prefixIcon: Icon(prefixIcon, color: AppColors.primary),
              suffixIcon: Icon(suffixIcon, color: AppColors.primary),
              hintText: hintText,
              hintStyle: TextStyle(color: AppColors.grayText, fontSize: 15),
              fillColor: AppColors.scaffoldBg,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.scaffoldBg),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.scaffoldBg),

              ),
            ),
          ),
        ),
      ],
    );
  }
}
