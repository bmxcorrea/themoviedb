import 'package:themoviedb/api/index.dart';

class Movie {
  final String title;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final double voteAverage;

  Movie(
    this.title,
    this.overview,
    this.backdropPath,
    this.posterPath,
    this.voteAverage,
  );

  factory Movie.fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final overview = json['overview'];
    final backdropPath = BASEURL_IMAGE + json['backdrop_path'];
    final posterPath = BASEURL_IMAGE + json['poster_path'];
    final voteAverage = json['vote_average'];

    return Movie(title, overview, backdropPath, posterPath, voteAverage);
  }
}
