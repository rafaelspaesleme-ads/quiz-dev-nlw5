import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/levelbutton/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quizcard/quiz_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller.getUser();
      controller.getQuizzes();
      controller.stateNotifier.addListener(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 20
          ),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!.map((e) => 
                  QuizCardWidget(
                    title: e.title, 
                    percent: e.questionAnswered/e.questions.length, 
                    stateInit: e.questionAnswered,
                    stateTotal: e.questions.length
                  ))
                  .toList(),
                ),
              )
            ],
          ),
        )
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }

  }
}