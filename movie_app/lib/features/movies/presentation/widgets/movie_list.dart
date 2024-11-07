import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/data/remote/movie_service.dart';
import 'package:movie_app/features/movies/data/repository/movie_repository.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/pages/movie_detail_page.dart';
import 'package:movie_app/features/movies/presentation/widgets/movie_list_item.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key, required this.endpoint});
  final MovieEndpoint endpoint;
  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: AppConstants.firstPageKey);

  Future<void> _fetchPage(int page) async {
    List<Movie> movies = await MovieRepository(movieService: MovieService())
        .getMovies(widget.endpoint, page);
    final bool isLastPage = movies.length < AppConstants.pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(movies);
    } else {
      _pagingController.appendPage(movies, page + 1);
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, Movie>(
      pagingController: _pagingController,
      scrollDirection: Axis.horizontal,
      builderDelegate: PagedChildBuilderDelegate(
        itemBuilder: (context, item, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailPage(movie: item),
                ));
          },
          child: MovieListItem(movie: item),
        ),
      ),
    );
  }
}
