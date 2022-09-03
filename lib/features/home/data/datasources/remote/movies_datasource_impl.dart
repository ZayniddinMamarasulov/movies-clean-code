import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../models/movies.dart';
import 'movies_datasource.dart';

class MoviesDataSourceImpl extends MoviesDataSource {
  @override
  Future<List<Movie>> getPopular() async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/popular'
        '?api_key=d8c23eac6c25c1e10788b33809f722e1'
        '&language=en-US'
        '&page=1');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var moviesJson = jsonResponse['results'] as List;

      List<Movie> movies =
          moviesJson.map((element) => Movie.fromJson(element)).toList();
      return movies;
    } else {
      throw Exception("Nimadir xatolik");
    }
  }
}
