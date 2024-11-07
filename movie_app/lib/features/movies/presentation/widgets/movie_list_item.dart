import 'package:flutter/material.dart';
import 'package:movie_app/features/movies/domain/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    movie.image,
                    height: 210,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    left: 6,
                    top: 6,
                    child: Stack(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.yellow.shade800,
                          size: 30,
                        ),
                        Positioned.fill(
                            child: Center(
                          child: Text(
                            movie.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        )),
                      ],
                    )),
              ],
            ),
            Text(
              movie.title,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
