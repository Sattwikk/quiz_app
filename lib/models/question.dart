import 'dart:math';

class Question {
  final String question;
  final String correctAnswer;
  final List<String> answers;

  Question({
    required this.question,
    required this.correctAnswer,
    required this.answers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    List<String> options = List<String>.from(json['incorrect_answers']);
    options.add(json['correct_answer']);
    options.shuffle(Random());

    return Question(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      answers: options,
    );
  }
}