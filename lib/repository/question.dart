import 'package:flutter_mvvm/api/stackexchange.dart';
import 'package:flutter_mvvm/response/question.dart';

class QuestionRepository {
  final StackExchangeApiClient _apiClient;

  QuestionRepository(this._apiClient);

  Future<List<Question>> findAll() =>
      _apiClient.getQuestions().then((value) => value.items);
}
