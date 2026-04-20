import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/question.dart';

class ApiService {
  static const String url =
      'https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple';

  static Future<List<Question>> fetchQuestions() async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List results = data['results'];

        return results.map((q) => Question.fromJson(q)).toList();
      } else {
        throw Exception("Failed to load questions");
      }
    } catch (e) {
      print("API Error: $e");
      return [];
    }
  }
}