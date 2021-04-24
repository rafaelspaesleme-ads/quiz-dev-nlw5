import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'chellenge_controller.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  ChallengePage({
    Key? key, 
    required this.questions,
    required this.title
    }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final challengeController = ChallengeController();
  final pageController = PageController();

  void initState() {
    pageController.addListener(() {
      challengeController.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (challengeController.currentPage < widget.questions.length)
      pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.bounceIn);
  }

  void onSelected(bool value) {
    if (value) {
      challengeController.countRight++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: challengeController.currentPageNotifier, 
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  length: widget.questions.length,
              )),
            ],
        )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(), // Travar carrocel entre paginas
        controller: pageController,
        children: widget.questions.map((e) => QuizWidget(
          question: e,
          onSelected: onSelected,
        ))
        .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ValueListenableBuilder<int>(
                  valueListenable: challengeController.currentPageNotifier, builder: (context, value, _) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (value < widget.questions.length)
                      Expanded(child: NextButtonWidget(
                        label: "Pular", 
                        onTab: nextPage,
                      )),
                    if (value == widget.questions.length)
                      SizedBox(
                        width: 7,
                      ),
                    if (value == widget.questions.length)
                      Expanded(child: NextButtonWidget(label: "Finalizar", confirm: true, onTab: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              title: widget.title,
                              length: widget.questions.length,
                              result: challengeController.countRight,
                            )
                          )
                        );
                      },)),
                  ]
                )),
              ),
      ),
    );
  }
}