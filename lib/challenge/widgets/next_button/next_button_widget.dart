import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final bool confirm;
  final bool purple;
  final bool transparent;
  final VoidCallback onTab;

  NextButtonWidget({
    required this.label, 
    this.confirm = false, 
    required this.onTab,
    this.purple = false,
    this.transparent = false
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            transparent 
              ? Colors.transparent
              : confirm ? (purple ? AppColors.purple : AppColors.darkGreen) : AppColors.white
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          side: MaterialStateProperty.all(
            BorderSide(
              color: transparent
                ? Colors.transparent
                : confirm ? (purple ? AppColors.lightGrey : AppColors.lightGreen) : AppColors.border
            )
          )
        ),
        onPressed: onTab, 
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: transparent
              ? AppColors.grey
              : confirm ? AppColors.white : AppColors.grey
          ),
        )
      )
    );
  }
}