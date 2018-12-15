import 'package:flutter/material.dart';
import './home.dart';
import '../widgets/horizontal_movie_list.dart';
import '../widgets/movie_page_view.dart';
import '../helpers/api.dart';

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HomeToolbar(),
          MoviePageView(dataSource: APIHelper().getNowPlayingMovies),
          HorizontalMovieList(
            title: "Upcoming Movies",
            dataSource: APIHelper().getUpcomingMovies,
          ),
          HorizontalMovieList(
            title: "Popular Movies",
            dataSource: APIHelper().getPopularMovies,
          ),
          HorizontalMovieList(
            title: "Trending Movies",
            dataSource: APIHelper().getTrendingMovies,
          ),
          HorizontalMovieList(
            title: "Top Rated Movies",
            dataSource: APIHelper().getTopRatedMovies,
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}
