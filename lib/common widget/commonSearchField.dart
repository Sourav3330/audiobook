import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class CommonSearchField extends StatelessWidget {
  final String hint;
  const CommonSearchField({super.key, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: AppColors.surface,
          filled: true,
          prefixIcon: Icon(Icons.search),
          hintText: hint,
          hintStyle: TextStyle(fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(9),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(9),
          ),
        ),
      ),
    );
  }
}
