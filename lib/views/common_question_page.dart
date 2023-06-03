import 'package:flutter/material.dart';
import '../components/common_question_body.dart';
import '../components/custom_app_bar.dart';

class CommonQuestionPage extends StatelessWidget {
  const CommonQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
          child: CommonQuestionBody()
      ),
    );
  }
}
