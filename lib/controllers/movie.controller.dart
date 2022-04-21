import 'package:get/get.dart';
import 'package:themoviedb/api/movie.dart';
import 'package:themoviedb/models/movie.dart';
import 'package:themoviedb/views/movie_detail.view.dart';

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
    currentMovie = movies.isNotEmpty ? movies.first : null;
    isLoading = false;
    update();
  }

  setCurrentMovie(int index) {
    currentMovie = movies[index];
    update();
  }

  goToDetail() {
    if (currentMovie != null) {
      Get.to(() => MovieDetailView(movie: currentMovie as Movie));
    }
  }
}
