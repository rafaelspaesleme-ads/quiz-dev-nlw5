import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  const ResultPage({
    Key? key, 
    required this.title, 
    this.length = 0, 
    this.result = 0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold
                      ),
                      TextSpan(
                        text: "\ncom $result de $length acertos.",
                        style: AppTextStyles.body
                      ),
                    ]
                  ),
                  textAlign: TextAlign.center,
                ),
              ]
            ),
            Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget(
                          label: "Compartilhar", 
                          onTab: () {
                            Share.share("DevQuiz NLW 5 - Flutter\nVeja meu resultado no quiz:\nAcertei ${((result/length)*100).toInt()}% das questões sobre $title");
                          },
                          purple: true,
                          confirm: true
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget(
                          label: "Voltar ao início", 
                          onTab: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage()
                              )
                            );
                          },
                          transparent: true
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}