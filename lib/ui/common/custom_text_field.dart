import 'package:flutter/material.dart';
import 'package:income_life/ui/common/app_colors.dart';
import 'package:income_life/ui/common/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.darkGrey,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorder),
          borderSide: const BorderSide(color: AppColors.darkGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kBorder),
          borderSide: const BorderSide(color: AppColors.lightGrey60),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.tealAccent,
        ),
      ),
      style: const TextStyle(
        color: AppColors.lightGrey70,
        fontSize: 18,
      ),
    );
  }
}
