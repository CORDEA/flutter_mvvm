import 'package:flutter/material.dart';
import 'package:flutter_mvvm/repository/question.dart';
import 'package:flutter_mvvm/response/question.dart';

class HomeViewModel extends ChangeNotifier {
  final QuestionRepository _repository;
  List<Question> _questions = [];

  HomeViewModel(this._repository);

  List<Question> get questions => _questions;

  void fetch() {
    _repository.findAll().then((value) {
      _questions = value;
      notifyListeners();
    });
  }
}
