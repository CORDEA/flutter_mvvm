import 'package:flutter/material.dart';
import 'package:flutter_mvvm/response/question.dart';

class DetailsViewModel extends ChangeNotifier {
  final Question _question;

  DetailsViewModel(this._question);

  String get title => _question.title;

  String get displayName => _question.owner.displayName;
}
