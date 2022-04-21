import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:themoviedb/controllers/movie.controller.dart';
import 'package:themoviedb/utils/utils.dart';
import 'package:themoviedb/views/widgets/imge_with_title.widget.dart';

class MovieView extends StatelessWidget {
  const MovieView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (_) {
        return Scaffold(
          body: _.isLoading
              ? Center(
                  child: Image.asset('spinner.gif'),
                )
              : ImageBackgroundWithTitle(
                  imageUrl: _.currentMovie?.posterPath as String,
                  title: _.currentMovie?.title as String,
                  subtitle: _.currentMovie?.overview as String,
                  callToAction: CallToAction('Show more info', () {
                    _.goToDetail();
                  }),
                  content: Container(
                    height: 200,
                    color: Colors.transparent,
                    child: Swiper(
                      itemCount: _.movies.length,
                      viewportFraction: 0.8,
                      scale: 0.8,
                      pagination: const SwiperPagination(),
                      control: const SwiperControl(size: 10),
                      onIndexChanged: (index) {
                        _.setCurrentMovie(index);
                      },
                      itemBuilder: (context, index) {
                        final movie = _.movies[index];
                        return ImageBackgroundWithTitle(
                          imageUrl: movie.backdropPath,
                          height: 200,
                          fontSize: 32,
                          borderRadius: 10,
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }
}
