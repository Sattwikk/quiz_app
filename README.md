# quiz_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
# 🎯 API-Driven Quiz App (Flutter)

A simple and interactive Quiz Application built using **Flutter + Dart**, which fetches real-time questions from the **Open Trivia Database API** and dynamically renders them in the UI.

---

## 🚀 Features

- 🌐 Fetches live quiz questions using REST API
- 📦 JSON parsing into Dart models
- 🧠 Dynamic state management using StatefulWidget
- 🏆 Score tracking system
- 🔄 Randomized answer options (shuffled)
- 📱 Clean and responsive UI
- ⚡ Smooth navigation between questions

---

## 🛠️ Tech Stack

- Flutter
- Dart
- HTTP package
- Open Trivia DB API

---

## 📁 Project Structure


lib/
├── main.dart
├── models/
│ └── question.dart
├── services/
│ └── api_service.dart
└── screens/
└── quiz_screen.dart


---

## 🌐 API Used

Open Trivia Database:


https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=multiple


---

## 🔄 App Workflow

1. App sends GET request to API
2. Receives JSON response
3. Parses data into Question model
4. Displays questions in UI
5. User selects answers
6. Score is updated dynamically
7. Final score is displayed

---

## ▶️ How to Run

```bash
flutter pub get
flutter run

💡 Learning Outcomes
API integration in Flutter
JSON parsing
State management using setState()
Clean architecture (models, services, UI separation)
👨‍💻 Author

Sattwik Bhattacharjee