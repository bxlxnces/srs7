import 'package:json_annotation/json_annotation.dart';

part 'dannye.g.dart';

@JsonSerializable()
class Dannye {
  final int userId;
  final int id;
  final String title;
  final String body;

  Dannye(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Dannye.fromJson(Map<String, dynamic> json) => _$DannyeFromJson(json);
  Map<String, dynamic> toJson() => _$DannyeToJson(this);
}
