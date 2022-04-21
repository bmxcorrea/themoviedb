import 'package:flutter/material.dart';
import 'package:themoviedb/models/movie.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(movie.title),
              background: Image.network(
                movie.backdropPath,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      const SizedBox(width: 10),
                      Text(movie.voteAverage.toString()),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 10),
                      Text(movie.releaseDate),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(movie.overview),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
