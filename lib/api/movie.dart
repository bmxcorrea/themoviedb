import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:themoviedb/api/index.dart';
import 'package:themoviedb/models/movie.dart';

const PARAMS = 'api_key=$API_KEY&language=en-US&page=';
const URL_MOVIES = '/movie/now_playing';

Future<List<Movie>> getMovies(int page) async {
  final url = Uri.parse('$BASEURL$URL_MOVIES?$PARAMS$page');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      final results = json["results"] as List;
      return results.map<Movie>((x) => Movie.fromJson(x)).toList();
    }
  } catch (_) {}
  return [];
}
