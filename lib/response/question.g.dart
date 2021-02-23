// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return Question(
    (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    Owner.fromJson(json['owner'] as Map<String, dynamic>),
    json['title'] as String,
    json['body'] as String,
  );
}

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'tags': instance.tags,
      'owner': instance.owner,
      'title': instance.title,
      'body': instance.body,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return Owner(
    json['display_name'] as String,
  );
}

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'display_name': instance.displayName,
    };
