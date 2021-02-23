import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  final List<String> tags;
  final Owner owner;
  final String title;
  final String body;

  Question(
    this.tags,
    this.owner,
    this.title,
    this.body,
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
