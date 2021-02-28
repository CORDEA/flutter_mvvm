import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mvvm/response/question.dart';

class DetailsViewModel extends ChangeNotifier {
  final Question _question;
  StreamController<DetailsEvent> _event = StreamController();

  DetailsViewModel(this._question);

  String get title => _question.title;

  String get displayName => _question.owner.displayName;

  Stream<DetailsEvent> get event => _event.stream;

  void onFabTapped() {
    _event.add(OpenUrl(_question.link));
  }

  @override
  void dispose() {
    super.dispose();
    _event.close();
  }
}

class DetailsEvent {
  DetailsEvent._();
}

class OpenUrl extends DetailsEvent {
  final String link;

  OpenUrl(this.link) : super._();
}
