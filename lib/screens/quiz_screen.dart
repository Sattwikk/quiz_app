import 'package:flutter/material.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/services/api_service.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  bool _answered = false;
  bool _loading = true;
  String _error = "";

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      print("🚀 Fetching API...");

      final data = await ApiService.fetchQuestions();

      print("📦 Questions received: ${data.length}");

      if (data.isEmpty) {
        setState(() {
          _error = "No questions received from API";
          _loading = false;
        });
        return;
      }

      setState(() {
        _questions = data;
        _loading = false;
      });
    } catch (e) {
      print("❌ Error: $e");
      setState(() {
        _error = "Failed to load questions";
        _loading = false;
      });
    }
  }

  void checkAnswer(String selected) {
    if (_answered) return;

    setState(() {
      _answered = true;

      if (selected == _questions[_currentIndex].correctAnswer) {
        _score++;
      }
    });
  }

  void nextQuestion() {
    setState(() {
      _currentIndex++;
      _answered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ⏳ Loading
    if (_loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // ❌ Error State
    if (_error.isNotEmpty) {
      return Scaffold(
        body: Center(
          child: Text(
            _error,
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      );
    }

    // ❌ Empty State
    if (_questions.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text("No questions available"),
        ),
      );
    }

    // 🏁 Finished Quiz
    if (_currentIndex >= _questions.length) {
      return Scaffold(
        appBar: AppBar(title: const Text("Quiz Completed")),
        body: Center(
          child: Text(
            "Final Score: $_score / ${_questions.length}",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    final question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Question ${_currentIndex + 1}/${_questions.length}",
              style: const TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              question.question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // 🔘 Answer Buttons
            ...question.answers.map((ans) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => checkAnswer(ans),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _answered
                        ? (ans == question.correctAnswer
                            ? Colors.green
                            : Colors.red)
                        : null,
                  ),
                  child: Text(ans),
                ),
              );
            }),

            const SizedBox(height: 20),

            // ➡️ Next Button
            if (_answered)
              ElevatedButton(
                onPressed: nextQuestion,
                child: const Text("Next Question"),
              ),
          ],
        ),
      ),
    );
  }
}