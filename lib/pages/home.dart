import 'package:films_app/bloc/config.dart';
import 'package:films_app/bloc/movies_list/movie_list_bloc.dart';
import 'package:films_app/bloc/movies_list/movie_list_event.dart';
import 'package:films_app/bloc/movies_list/movie_list_state.dart';
import '../routes.dart';
import 'file:///C:/Users/ola77/AndroidStudioProjects/films_app/lib/models/movie_list/movie_list.dart';
import 'package:films_app/repository/movies_repo.dart';
import 'package:films_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double fontSize = 20;
  Size size;
  List<MovieList> movieList;
  MovieList movieListDetails;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: buildbody(),
        bottomNavigationBar: buildBottomNavigatorBar(),
      ),
    );

  }







  Widget buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
        // preferredSize: Size.fromHeight(20),
        child: Padding(
          padding:  EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.search,
              color: Colors.black12,
            ),
          ),
        ) ,

      ),  );
  }
  Widget buildAddress() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Text(
            " Films in ",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Text(
            " London ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Icon(Icons.arrow_drop_down)
        ],
      ),
    );
  }
  Widget buildbody() {
    return SingleChildScrollView(
      child: Column(

        children: [
          buildAddress(),
          Container(
              height: size.height * .5,
              child: buildDefaultTabController(fontSize)),
          buildAllFilms(),
          SizedBox(
            height: 16,
          ),
         Container(

             child: buildAllFilmsList(
                 context,MoviesRepository.NowPlaying)),
          // buildNewData(),
        ],
      ),
    );
  }
  Widget buildDefaultTabController(double fontSize) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        //  backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            //preferredSize: Size.fromHeight(40),
            child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                  labelPadding: EdgeInsets.symmetric(horizontal: 16),
                  //indicatorPadding: EdgeInsets.symmetric(vertical: 16),
                  // indicatorColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 3.0),
                      insets: EdgeInsets.symmetric(horizontal:16.0)),
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  isScrollable: true,
                  tabs: [
                    Text(
                      "New",
                      style: TextStyle(fontSize: fontSize),
                    ),
                    Text(
                      "Popular",
                      style: TextStyle(fontSize: fontSize),
                    ),
                    Text(
                      "Showing now",
                      style: TextStyle(fontSize: fontSize),
                    ),
                  ]),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            buildMoviesList(context,MoviesRepository.Latest),
            buildMoviesList(context,MoviesRepository.Popular),
            buildMoviesList(context,MoviesRepository.NowPlaying),

          ],
        ),
      ),
    );
  }
  Widget buildMoviesList(BuildContext context,String type) {

    return BlocProvider<MovieListBloc>(
      create: (_)=>MovieListBloc()..add(FetchMovieList(type:type )),
      child: BlocConsumer<MovieListBloc, MovieListState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieListLoading) {
              return Loading() ;
            }
            if (state is MovieListSuccess) {
              return  buildList(movieList: state.results,);

            } else {
              return Container();
            }
          }
      ),
    );
  }
  Widget buildList({List<MovieList> movieList}) {

    return Container(

     height: size.height ,
      width: size.width * .60,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children:
          movieList.map((e) =>
              buildImageContainer(
                movieListDetails: e ,
                width: size.width * .4,
                height:size.height * .7,)
          ).toList()
        //text: Text(movieList[index].title),
      ),
    );
  }
  Widget buildImageContainer({ double height, double width,Widget text,MovieList movieListDetails}) {
  //  print(img);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(
            context,
            DETAILS,arguments:movieListDetails );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 5,
          shadowColor: Colors.blueGrey,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('${IMAGE_BASE_URL}${movieListDetails.posterPath}'??''),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
            height: height,
            width: width,
            //child: text,
          ),
        ),
      ),
    );
  }
  Widget buildAllFilms() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          "All Films",
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
  Widget buildAllFilmsList(BuildContext context,String type){
    return BlocProvider<MovieListBloc>(
      create: (_)=>MovieListBloc()..add(FetchMovieList(type:type )),
      child: BlocConsumer<MovieListBloc, MovieListState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is MovieListLoading) {
              return Loading() ;
            }
            if (state is MovieListSuccess) {
              return  buildAllFilmsData(movieList: state.results,);

            } else {
              return Container();
            }
          }
      ),
    );
}
  Widget buildAllFilmsData({List<MovieList> movieList}) {
    return ListView(
      shrinkWrap: true,
     physics: ClampingScrollPhysics(),
     //  scrollDirection: Axis.vertical,
        children:
        movieList.map((e) =>
            Row(
              children: [
                buildImageContainer(
                  movieListDetails: e ,
                  width: size.width * .3,
                  height:size.height * .15,),
                Container(
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e.title}',style: TextStyle(fontSize: fontSize),),
                        SizedBox(height: 10,),
                        buildRatingBar(),
                        SizedBox(height: 10,),
                        Text('${e.originalTitle}',style: TextStyle(fontSize: fontSize),),

                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ],
            )).toList()
      //text: Text(movieList[index].title),
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
      itemBuilder: (context, _) =>
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
  Widget buildBottomNavigatorBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 5,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.search),label: "" ),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "" ),
        BottomNavigationBarItem(icon: Icon(Icons.notification_important,),label: ""
        ),
      ],
    );
  }
}


