import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonWidget extends StatelessWidget {
  final String label;
  LevelButtonWidget({
    Key? key, 
    required this.label
  }) : assert(["Fácil", "Médio", "Difícil", "Perito"].contains(label)) , super(key: key);

  final config = {
    "Fácil": {
      "backgroundColor": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "backgroundColor": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "backgroundColor": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "backgroundColor": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    },
  };

Color get backgroundColor => config[label]!['backgroundColor']!;
Color get borderColor => config[label]!['borderColor']!;
Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: backgroundColor,
        border: Border.fromBorderSide(
          BorderSide(
            color: borderColor
          )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13
          ),
        ),
      ),
    );
  }
}