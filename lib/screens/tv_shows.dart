import 'package:flutter/material.dart';
import '../widgets/horizontal_movie_list.dart';
import '../widgets/movie_page_view.dart';
import '../helpers/api.dart';

class TVShows extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            TVShowsToolbar(),
            MoviePageView(
              dataSource: APIHelper().getOnTheAirTVShows,
            ),
            HorizontalMovieList(
              title: "Airing Today",
              dataSource: APIHelper().getAiringTodayTVShows,
            ),
            HorizontalMovieList(
              title: "Popular Shows",
              dataSource: APIHelper().getPopularTVShows,
            ),
            HorizontalMovieList(
              title: "Trending Shows",
              dataSource: APIHelper().getTrendingTVShows,
            ),
            HorizontalMovieList(
              title: "Top Rated Shows",
              dataSource: APIHelper().getTopRatedTVShows,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}

class TVShowsToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "On The Air ...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text("Welcome home")
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 50,
            onPressed: () {
              Navigator.pushNamed(context, "/signin");
            },
          ),
          // InkResponse(
          //   highlightShape: BoxShape.circle,
          //   onTap: () {
          //     Navigator.pushNamed(context, "/myprofile");
          //   },
          //   child: CircleAvatar(
          //     radius: 25,
          //     backgroundImage: NetworkImage(
          //       "https://avatars1.githubusercontent.com/u/10810343?s=460&v=4",
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
