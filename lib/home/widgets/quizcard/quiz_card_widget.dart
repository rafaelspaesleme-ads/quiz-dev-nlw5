import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int stateInit;
  final int stateTotal;
  final double percent;
  final VoidCallback onTab;

  const QuizCardWidget({
    Key? key, 
    required this.title,
    required this.percent,
    required this.stateInit,
    required this.stateTotal, 
    required this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
          child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.border
            ),
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    stateInit.toString() + "/" + stateTotal.toString(),
                    style: AppTextStyles.body8,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(
                    value: percent,
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}