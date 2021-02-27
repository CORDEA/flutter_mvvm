import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/repository/question.dart';
import 'package:flutter_mvvm/response/question.dart';

class HomeViewModel extends ChangeNotifier {
  final QuestionRepository _repository;
  List<HomeItemViewModel> _questions = [];
  StreamSubscription? _subscription;

  HomeViewModel(this._repository);

  List<HomeItemViewModel> get questions => _questions;

  void fetch() {
    _subscription = _repository
        .findAll()
        .asStream()
        .map((list) => list.map((q) => HomeItemViewModel(q)).toList())
        .listen((value) {
      _questions = value;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}

class HomeItemViewModel {
  final Question _question;

  HomeItemViewModel(this._question);

  String get title => _question.title;

  String get displayName => _question.owner.displayName;
}
