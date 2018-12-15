import 'package:flutter/material.dart';
import '../widgets/page_transformer.dart';

import '../widgets/horizontal_movie_list.dart';
import '../widgets/horizontal_person_list.dart';
import '../widgets/horizontal_genre_list.dart';
import '../helpers/api.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var trendings = [];
  void initState() {
    super.initState();
    APIHelper().getNowPlayingMovies().then((data) {
      setState(() {
        trendings = data["results"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              HomeToolbar(),
              Container(
                height: 450,
                child: MoviePageView(trendings: trendings),
              ),
              HorizontalMovieList(
                title: "Upcoming Movies",
                dataSource: APIHelper().getUpcomingMovies,
              ),
              HorizontalMovieList(
                title: "Trending Movies",
                dataSource: APIHelper().getTrendingMovies,
              ),
              HorizontalMovieList(
                title: "Top Rated Movies",
                dataSource: APIHelper().getTopRatedMovies,
              ),
              HorizontalPersonList(
                title: "Popular Artists",
                dataSource: APIHelper().getPopularArtists,
              ),
              HorizontalGenreList(
                title: "Movie Geners",
                dataSource: APIHelper().getMovieGenres,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoviePageView extends StatelessWidget {
  const MoviePageView({
    Key key,
    @required this.trendings,
  }) : super(key: key);

  final List trendings;

  @override
  Widget build(BuildContext context) {
    return PageTransformer(
      pageViewBuilder: (context, pageVResolver) {
        return PageView.builder(
          controller: PageController(viewportFraction: 0.80),
          itemBuilder: (context, index) {
            var movie = trendings[index];
            final pageVisibility = pageVResolver.resolvePageVisibility(index);

            // Use these two properties to transform your "Hello World" text widget!
            // In this example, the text widget fades in and out of view, since we use
            // the visibleFraction property, which can be between 0.0 - 1.0.
            final position = pageVisibility.pagePosition;
            final visibleFraction = pageVisibility.visibleFraction;
            return Card(
              margin: EdgeInsets.only(right: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      APIHelper().getPosterUrl(movie["poster_path"]),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: trendings.length,
        );
      },
    );
  }
}

class HomeToolbar extends StatelessWidget {
  const HomeToolbar({
    Key key,
  }) : super(key: key);

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
                  "Now Playing ...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text("Welcome home, Aawaz")
              ],
            ),
          ),
          InkResponse(
            highlightShape: BoxShape.circle,
            onTap: () {
              Navigator.pushNamed(context, "/search");
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://avatars1.githubusercontent.com/u/10810343?s=460&v=4",
              ),
            ),
          )
        ],
      ),
    );
  }
}
