import 'package:films_app/bloc/cast/cast_bloc.dart';
import 'package:films_app/bloc/cast/cast_event.dart';
import 'package:films_app/bloc/cast/cast_state.dart';
import 'package:films_app/bloc/config.dart';
import 'package:films_app/bloc/movie_list_details/movie_list_details_bloc.dart';
import 'package:films_app/bloc/movie_list_details/movie_list_details_event.dart';
import 'package:films_app/bloc/movie_list_details/movie_list_details_state.dart';
import 'package:films_app/bloc/movies_list/movie_list_bloc.dart';
import 'package:films_app/bloc/movies_list/movie_list_event.dart';
import 'package:films_app/bloc/movies_list/movie_list_state.dart';
import 'package:films_app/models/cast/cast_details.dart';
import 'package:films_app/models/movie_list_details/movie_list_details_response.dart';
import 'package:films_app/repository/cast_repo.dart';
import 'package:films_app/repository/movies_details_repo.dart';
import 'package:films_app/repository/movies_repo.dart';
import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list.dart';
import 'package:films_app/widgets/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetails extends StatefulWidget {


  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  double fontSize = 20;
  Size size;
  MovieList movieListDetails;
 // List<MovieList> movieList;
  List<CastDetails> castList;
  CastDetails castDetails;



  @override
  Widget build(BuildContext context) {
    movieListDetails = ModalRoute.of(context).settings.arguments;
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton:
      buildFloatingActionButton(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(

      backgroundColor: Color(0xfff9f9f9),
      elevation: 0,

      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(

          Icons.arrow_back_ios,
          color: Color(0xffABB7B3),
        ),
      ),
    );
  }
  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        //mainAxisSize: MainAxisSize.min,
        //  mainAxisAlignment: MainAxisAlignment.start,
       // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFirstSection(),
          buildSecondSection(),
          Container(
              child: buildThirdSection()),

        ],
      ),
    );
  }



  // Widget buildFirstSection(BuildContext context,String id) {
  //
  //   return    buildContainer();
  //   //   BlocProvider<MovieListDetailsBloc>(
  //   //   create: (_)=>MovieListDetailsBloc()..add(FetchMovieListDetails(id:id )),
  //   //   child: BlocConsumer<MovieListDetailsBloc, MovieListDetailsState>(
  //   //       listener: (context, state) {},
  //   //       builder: (context, state) {
  //   //         if (state is MovieListDetailsLoading) {
  //   //           return Loading() ;
  //   //         }
  //   //         if (state is MovieListDetailsSuccess) {
  //   //           return  buildContainer(movieListDetails: movieListDetails );
  //   //         } else {
  //   //           return Container();
  //   //         }
  //   //       }
  //   //   ),
  //   // );
  // }

  Widget buildFirstSection(){
    return Container(
      height: size.height * .3,

      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      color: Color(0xfff9f9f9),
      child: Row(
        //mainAxisSize: MainAxisSize.max,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
           buildImage(),
           buildImageData(),
         // Container(),
        ],
      ),
    );
  }

  Widget buildSecondSection() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${movieListDetails.overview}',
            textAlign: TextAlign.start,
            maxLines: 5,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildReviews(num:'${movieListDetails.voteAverage}',text:    'Score'),
              Container(
                  height: 70,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    endIndent: 8,
                    indent: 8,
                    width: 2,
                  )),
              buildReviews(num:    '${movieListDetails.favoriteCount}', text: "Reviews"),
              Container(
                  height: 70,
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 2,
                    endIndent: 8,
                    indent: 8,
                    width: 2,
                  )),
              buildReviews(num:    '${movieListDetails.popularity}', text: "Popularity"),
            ],
          )
        ],
      ),
    );
  }

  Widget buildThirdSection() {
    return Container(
      child: Column(
        // shrinkWrap: true,
        // physics: ClampingScrollPhysics(),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Cast",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          buildCast( context,CastRepository.id

          )
        ],
      ),
    );
  }



  Widget buildCast(BuildContext context,int id) {

    return BlocProvider<CastBloc>(
      create: (_)=>CastBloc()..add(FetchCastList(id:id)),
      child: BlocConsumer<CastBloc, CastState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is CastLoading) {
              return Loading() ;
            }
            if (state is CastSuccess) {
              return  buildImagesList(castList: state.cast,);

            } else {
              return Container();
            }
          }
      ),
    );
  }

  Widget buildImagesList({List<CastDetails> castList}) {
    return Container(
      height: 160,
      child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children:
          castList.map((e) =>
              Column(
               //   crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  buildCastImage(
                    castDetails: e,
                    //   width: size.width * .3,
                    //  height:size.height * .15,
                  ),
                  Text(
                    '${e.name}', style: TextStyle(fontSize: fontSize),),
                  SizedBox(height: 10,),

                ],
              )).toList()

      ),
    );
  }

  /// First_Section
  Widget buildImage( ) {
    return Stack(
      children: [
       buildImageContainer(
           img: movieListDetails.posterPath),
        Positioned(
          bottom: 90,
          left: 70,
          child: Container(
            padding: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * .05,
            width: MediaQuery.of(context).size.width * .1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color(0xffB8B8B8)),
            child: Center(
                child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            )),
          ),
        ),
      ],
    );
  }

  Widget buildImageData() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${movieListDetails.title}',
            style: TextStyle(
              
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold
            ),
            
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${movieListDetails.listType}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          buildRatingBar(),
          SizedBox(
            height: 5,
          ),
          Text(
      '${movieListDetails.listType}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '${movieListDetails.iso_639_1}',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget buildRatingBar() {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemSize: 15,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  /// Second_Section
  Widget buildReviews({String num, String text}) {
    return Column(
      children: [
        Text(
          num,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(text),
      ],
    );
  }

  /// Third_Section

  Widget buildImageContainer({String img ,}) {
    //print(img);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('${IMAGE_BASE_URL}$img'??''),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white),
        height: size.height * .3,
        width: size.width * .35,
        //child: text,
      ),
    );
  }

  Widget buildCastImage({String img ,CastDetails castDetails}) {
    //print(img);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
         radius: 55,
          child: ClipOval(
            child:

              Image.network('${IMAGE_BASE_URL}${castDetails.profilePath}'??'',
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),

            ),


      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton.extended(
      onPressed: () {
      },
      label: Text('Buy Tickets'),
      backgroundColor: Colors.green,
      shape:RoundedRectangleBorder(
        borderRadius:  BorderRadius.all(
          Radius.circular(15),

        ),
      ),
    );
  }

}




/// Comments Code

// Widget buildImagesList({List<MovieList> movieList}) {
//   return Expanded(
//     // height: size.height * .5,
//     child: ListView(
//       scrollDirection: Axis.horizontal,
//      children: [
//        movieList.map((e) => buildImage(img: e.posterPath)).toList()
//
//      ],
//     ),
//   );
// }


// Widget buildHeroImage({String img}) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//     child: Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage('${IMAGE_BASE_URL}$img'??''),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.circular(15),
//           color: Colors.transparent),
//       height: size.height * .3,
//       width: size.width * .35,
//     ),
//   );
// }