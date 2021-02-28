// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Questions _$QuestionsFromJson(Map<String, dynamic> json) {
  return Questions(
    (json['items'] as List<dynamic>)
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuestionsToJson(Questions instance) => <String, dynamic>{
      'items': instance.items,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    Owner.fromJson(json['owner'] as Map<String, dynamic>),
    json['link'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'tags': instance.tags,
      'owner': instance.owner,
      'link': instance.link,
      'title': instance.title,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    json['display_name'] as String,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'display_name': instance.displayName,
    };
