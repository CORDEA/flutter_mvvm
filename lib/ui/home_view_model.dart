import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/repository/question.dart';
import 'package:flutter_mvvm/response/question.dart';

class HomeViewModel extends ChangeNotifier {
  final QuestionRepository _repository;
  List<HomeItemViewModel> _questions = [];
  StreamController<HomeEvent> _event = StreamController();
  StreamSubscription? _subscription;

  HomeViewModel(this._repository);

  List<HomeItemViewModel> get questions => _questions;

  Stream<HomeEvent> get event => _event.stream;

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

  void onItemTapped(int index) {
    _event.add(NavigateToDetails());
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
    _event.close();
  }
}

class HomeItemViewModel {
  final Question _question;

  HomeItemViewModel(this._question);

  String get title => _question.title;

  String get displayName => _question.owner.displayName;
}

class HomeEvent {
  HomeEvent._();
}

class NavigateToDetails extends HomeEvent {
  NavigateToDetails() : super._();
}
