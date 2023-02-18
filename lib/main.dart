import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/question.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final Quiz _quiz = Quiz();
  int _currentQuestionIndex = 0;
  int _correctAnswers = 0;

  void _answerQuestion(String answer) {
    if (answer == _quiz.questions[_currentQuestionIndex]['correct_answer']) {
      setState(() {
        _correctAnswers++;
      });
    }

    if (_currentQuestionIndex < _quiz.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Quiz finished!'),
          content: Text('You got $_correctAnswers out of ${_quiz.questions.length} questions correct.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Question currentQuestion = Question(
      question: _quiz.questions[_currentQuestionIndex]['question'],
      answers: _quiz.questions[_currentQuestionIndex]['answers'],
      correctAnswer: _quiz.questions[_currentQuestionIndex]['correct_answer'],
    );

    List<Widget> answerButtons = currentQuestion.answers.map((answer) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          onPressed: () => _answerQuestion(answer),
          child: Text(answer),
        ),
      );
    }).toList();

    return Scaffold(
