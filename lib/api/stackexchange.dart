import 'dart:convert';

import 'package:flutter_mvvm/response/question.dart';
import 'package:http/http.dart' as http;

class StackExchangeApiClient {
  static const _HOST = 'api.stackexchange.com';
  static const _QUESTIONS = '/2.2/questions';

  Future<Questions> getQuestions() {
    var uri = Uri.https(_HOST, _QUESTIONS, {
      'site': 'stackoverflow',
      'sort': 'activity',
      'order': 'desc',
    });
    return http
        .get(uri)
        .then((value) => Questions.fromJson(jsonDecode(value.body)));
  }
}
