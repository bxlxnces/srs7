import 'dart:convert';
import 'package:dmregister/model/photo.dart';
import 'package:http/http.dart' as http;

class AlbumConnect {
  Future<List<Album>> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Album.fromJson(data)).toList();
    } else {
      throw Exception('Ошибка');
    }
  }
}
