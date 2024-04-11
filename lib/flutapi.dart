import 'package:dio/dio.dart';
import 'package:dmregister/model/flut.dart';
import 'package:retrofit/retrofit.dart';

part 'flutapi.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class FlutApi {
  factory FlutApi(Dio dio, {String baseUrl}) = _FlutApi;

  @GET("/posts")
  Future<List<Flut>> getPosts();
}
