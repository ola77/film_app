import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:films_app/models/cast/cast_response.dart';
import 'package:films_app/repository/cast_repo.dart';
import 'cast_event.dart';
import 'cast_state.dart';
import 'package:films_app/utilities/internetConnectivity.dart';


class CastBloc extends Bloc<CastEvent, CastState> {
  CastBloc() : super(CastInitial());
  ///ygelbi eldata elly f CastResponse
  CastResponse Cast  ;

  ///hena b2olo yfetch eldata elly f el Castlist
  @override
  Stream<CastState> mapEventToState(CastEvent event) async* {
    if (event is FetchCastList) {
      yield* fetchCast(event);
    }
  }
  ///hena b2olo w hwa byfetch el data
  /// 2wl 7aga y3ml loading
  /// lo el net tmm ygeb el cast
  /// lo el results != tb2a keda hya success w yb3tli el data
  /// 8er keda yb3t error message
  Stream<CastState> fetchCast(FetchCastList event) async* {

    yield CastLoading();
    if (await isInternetConnected()) {
      Cast = await CastRepository.getCast(event.id);
    //  print(Cast.cast.toString());
      // yield MovieListLoading();
      if (Cast != null) {
        // movieList=results;
        print('success');
        yield CastSuccess(cast: Cast.cast);
      } else
        yield CastFailure(error: cast.toString());
    }  else
      yield CastFailure(error: internetErrorMessage());
  }
}



