import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Questions {
  final List<Question> items;

  Questions(this.items);

  factory Questions.fromJson(Map<String, dynamic> json) =>
      _$QuestionsFromJson(json);
}

@JsonSerializable()
class Question {
  final List<String> tags;
  final Owner owner;
  final String link;
  final String title;

  Question(
    this.tags,
    this.owner,
    this.link,
    this.title,
  );

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

@JsonSerializable()
class Owner {
  @JsonKey(name: 'display_name')
  final String displayName;

  Owner(this.displayName);

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
