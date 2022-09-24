import 'package:flutter_quiz_app/models/api_response.dart';
import 'package:flutter_quiz_app/models/categories.dart';
import 'package:flutter_quiz_app/models/quiz.dart';
import 'package:flutter_quiz_app/service/base_api.dart';

class QuizService {
  Future<APIResponse<List<Quiz>>> getQuizList({
    required int limit,
    List<String> categories = const [],
    region,
    difficulty,
  }) async {
    String url = '/questions?';
    if (categories.isNotEmpty) {
      url += 'categories=';
      for (String categorie in categories) {
        url += '${categoriesMap[categorie]},';
      }
    }
    url += '&limit=$limit';
    if (region != null) {
      url += '&region=$region';
    }
    if (difficulty != null) {
      url += '&difficulty=$difficulty';
    }

    APIResponse response = await BaseApi().get(url);

    if (!response.error) {
      final quizzes = quizFromJson(response.data);
      return APIResponse<List<Quiz>>(
        data: quizzes,
      );
    }

    return APIResponse(
      error: true,
      errorMessage: 'An error ocurred trying to fetch quizzes',
    );
  }
}
