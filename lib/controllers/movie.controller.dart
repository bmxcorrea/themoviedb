import 'package:get/get.dart';
import 'package:themoviedb/api/movie.dart';
import 'package:themoviedb/models/movie.dart';

class MovieController extends GetxController {
  bool isLoading = true;
  int page = 1;
  List<Movie> movies = [];
  Movie? currentMovie;

  @override
  void onInit() {
    loadMovies();
    super.onInit();
  }

  loadMovies() async {
    movies = await getMovies(page);
    currentMovie = movies.first;
    isLoading = false;
    update();
  }

  setCurrentMovie(int index) {
    currentMovie = movies[index];
    update();
  }
}
