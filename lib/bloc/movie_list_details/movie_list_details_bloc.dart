// // import 'dart:async';
// // import 'package:bloc/bloc.dart';
// // import 'package:films_app/models/movie_list/movie_list.dart';
// // import 'package:films_app/models/movie_list/movie_list_response.dart';
// import 'package:films_app/repository/movies_details_repo.dart';
// import 'package:films_app/utilities/internetConnectivity.dart';
// import 'movie_list_details_event.dart';
// import 'movie_list_details_state.dart';
//
//
// class MovieListDetailsBloc extends Bloc<MovieListDetailsEvent, MovieListDetailsState> {
//   MovieListDetailsBloc() : super(MovieListDetailsInitial());
//    List<MovieList>details= [];
//   MovieListResponse movieListResponse  ;
//
//   @override
//   Stream<MovieListDetailsState> mapEventToState(MovieListDetailsEvent event) async* {
//     if (event is FetchMovieListDetails) {
//       yield* fetchMovie(event);
//     }
//   }
//
//
//   Stream<MovieListDetailsState> fetchMovie(FetchMovieListDetails event) async* {
//    yield MovieListDetailsLoading();
//     if (await isInternetConnected()) {
//         movieListResponse =   await MoviesListDetailsRepository.getDetails(event.id);
//       print(movieListResponse.results.toString());
//       // yield MovieListLoading();
//       if (movieListResponse != null) {
//         details=movieListResponse.results;
//        // movieList=results;
//         print('success');
//         yield MovieListDetailsSuccess(details:movieListResponse.results);
//       } else
//         yield MovieListDetailsFailure(error: movieListResponse.toString());
//     }  else
//         yield MovieListDetailsFailure(error: internetErrorMessage());
//       }
//     }
//
