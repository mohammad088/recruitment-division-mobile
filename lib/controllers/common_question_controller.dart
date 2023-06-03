import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../components/dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/add_common_question_model.dart';
import '../models/common_question_model.dart';

class CommonQuestionController extends GetxController {
  String link = 'http://10.0.2.2:8000';
  int role = 1;
  final GlobalKey<GetBuilderState> GetBuilderkey = GlobalKey();
  int index = 0;
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  late String token;
  late SharedPreferences prefs;
  late List<Data> data;
  List<Question> questions = [];
  late CommonQuestions commonQuestions;
  late AddCommonQuestion addCommonQuestion;
  Future<dynamic> getAllQuestions(token) async {
    try {
      final response =
          await Dio().get('$link/api/question_and_answer',
              options: Options(
                headers: {'Content-Type': 'application/json'},
              ),
              data: {'token': token});
      if (response.statusCode == 200 && response.data != '') {
        commonQuestions = CommonQuestions.fromJson(response.data);
        data = commonQuestions.data ?? [];
        for (var question in data) {
          questions.add(Question(data: question));
        }
        update();
      }
    } catch (error) {
      error.printError();
      dialog('خطأ بالاتصال بالشبكة');
      update();
    }
  }

  void changeExpantion(int index) {
    questions[index].isExpanded = !questions[index].isExpanded;
    update();
  }

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
    await getrole();
    await getAllQuestions(token);
    super.onInit();
  }

  Future<dynamic> addNewQuestion(String question, String answer, token) async {
    try {
      final response = await Dio().post(
          '$link/api/question_and_answer/store',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: {'question': question, 'answer': answer, 'token': token});
      if (response.statusCode == 200 && response.data != '') {
        addCommonQuestion = AddCommonQuestion.fromJson(response.data);
        questions.add(Question(data: addCommonQuestion.data!));
        update();
      }
    } catch (error) {
      error.printError();
      dialog('خطأ');
      update();
    }
  }

  Future<dynamic> updateQuestionAndAnswer(
      String question, String answer, String token, int index) async {
    try {
      final response = await Dio().post(
          '$link/api/question_and_answer/update/$index',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: {'question': question, 'answer': answer, 'token': token});
      if (response.statusCode == 200 && response.data != '') {
        addCommonQuestion = AddCommonQuestion.fromJson(response.data);
        int value =
            questions.indexWhere((question) => question.data.id == index);
        questions[value] = Question(data: addCommonQuestion.data!);
        update();
      }
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
    }
  }

  Future<dynamic> deleteQuestion(String token, int index) async {
    try {
      final response = await Dio().post(
          '$link/api/question_and_answer/delete/$index',
          options: Options(headers: {'Content-Type': 'application/json'}),
          data: {'token': token});
      if (response.statusCode == 200) {
        questions.removeWhere((question) => question.data.id == index);
        update();
      }
    } catch (error) {
      error.printError();
      dialog('هنالك خطأ');
      update();
    }
  }

  Future<dynamic> getrole() async {
    role = prefs.getInt('role') ?? 1;
    if (role > 1) {
      update();
    }
  }
}

class Question {
  Data data;
  bool isExpanded;
  Question({required this.data, this.isExpanded = false});
}
