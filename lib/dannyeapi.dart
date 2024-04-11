import 'package:dmregister/model/dannye.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'dannyeapi.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class UserData {
  factory UserData(Dio dio, {String baseUrl}) = _UserData;

  @GET("/posts/1")
  Future<Dannye> getPost();
}
