// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dannye.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dannye _$DannyeFromJson(Map<String, dynamic> json) => Dannye(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$DannyeToJson(Dannye instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
    };
