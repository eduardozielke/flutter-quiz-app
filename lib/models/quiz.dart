import 'dart:convert';

List<Quiz> quizFromJson(String str) =>
    List<Quiz>.from(json.decode(str).map((x) => Quiz.fromJson(x)));

String quizToJson(List<Quiz> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quiz {
  Quiz({
    this.category,
    this.id,
    this.correctAnswer,
    this.incorrectAnswers,
    this.question,
    this.tags,
    this.type,
    this.difficulty,
    this.regions,
  });

  String? category;
  String? id;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  String? question;
  List<String>? tags;
  String? type;
  String? difficulty;
  List<dynamic>? regions;

  factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        category: json["category"],
        id: json["id"],
        correctAnswer: json["correctAnswer"],
        incorrectAnswers:
            List<String>.from(json["incorrectAnswers"].map((x) => x)),
        question: json["question"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        type: json["type"],
        difficulty: json["difficulty"],
        regions: List<dynamic>.from(json["regions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "id": id,
        "correctAnswer": correctAnswer,
        "incorrectAnswers": List<dynamic>.from(incorrectAnswers!.map((x) => x)),
        "question": question,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "type": type,
        "difficulty": difficulty,
        "regions": List<dynamic>.from(regions!.map((x) => x)),
      };
}
