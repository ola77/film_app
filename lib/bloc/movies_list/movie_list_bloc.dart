import 'dart:async';
import 'package:bloc/bloc.dart';
import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list_response.dart';
import 'package:films_app/repository/movies_repo.dart';
import 'package:films_app/utilities/internetConnectivity.dart';
import 'movie_list_event.dart';
import 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  MovieListBloc() : super(MovieListInitial());
  ///ygelbi eldata elly f MovieListResponse
 MovieListResponse results  ;
 ///hena b2olo yfetch eldata elly f el movielist
  @override
  Stream<MovieListState> mapEventToState(MovieListEvent event) async* {
    if (event is FetchMovieList) {
      yield* fetchMovie(event);
    }
  }
///hena b2olo w hwa byfetch el data
  /// 2wl 7aga y3ml loading
  /// lo el net tmm ygeb el results
  /// lo el results != tb2a keda hya success w yb3tli el data
  /// 8er keda yb3t error message
  Stream<MovieListState> fetchMovie(FetchMovieList event) async* {

   yield MovieListLoading();
    if (await isInternetConnected()) {
      results = await MoviesRepository.getResults(event.type);
      print(results.results.toString());
      // yield MovieListLoading();
      if (results != null) {
       // movieList=results;
        print('success');
        yield MovieListSuccess(results: results.results);
      } else
        yield MovieListFailure(error: results.toString());
    }  else
        yield MovieListFailure(error: internetErrorMessage());
      }
    }

