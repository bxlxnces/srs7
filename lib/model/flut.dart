import 'package:json_annotation/json_annotation.dart';

part 'flut.g.dart';

@JsonSerializable()
class Flut {
  final int userId;
  final int id;
  final String title;
  final String body;

  Flut(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Flut.fromJson(Map<String, dynamic> json) => _$FlutFromJson(json);
  Map<String, dynamic> toJson() => _$FlutToJson(this);
}
