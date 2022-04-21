import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:themoviedb/controllers/movie.controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      init: MovieController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Text(_.isLoading ? 'Loading...' : 'The movie DB'),
          ),
        );
      },
    );
  }
}
