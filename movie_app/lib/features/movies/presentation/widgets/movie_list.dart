import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_app/core/app_constants.dart';
import 'package:movie_app/core/movie_endpoint.dart';
import 'package:movie_app/features/movies/domain/movie.dart';
import 'package:movie_app/features/movies/presentation/blocs/movie_bloc.dart';
import 'package:movie_app/features/movies/presentation/blocs/movie_event.dart';
import 'package:movie_app/features/movies/presentation/blocs/movie_state.dart';
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

 
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      context
          .read<MovieBloc>()
          .add(GetMoviesEvent(endpoint: widget.endpoint, page: pageKey));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MovieBloc, MovieState>(
      listener: (context, state) {
         if (state is MovieLoaded) {
          if (state.hasReachedEnd) {
            _pagingController.appendLastPage(state.movies);
          } else {
            final nextPageKey = _pagingController.nextPageKey! + 1;
            _pagingController.appendPage(state.movies, nextPageKey);
          }
        } else if (state is MovieError) {
          _pagingController.error = state.message;
        }
      },
      child: PagedListView<int, Movie>(
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
      ),
    );
  }
}
