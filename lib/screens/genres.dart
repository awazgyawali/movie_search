import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';
import '../widgets/horizontal_genre_list.dart';
import '../helpers/api.dart';

class Genres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(25),
            child: Text(
              "Movie Genres",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AsyncLoader(
              initState: () => APIHelper().getMovieGenres(),
              renderLoad: () {
                return Center(child: CircularProgressIndicator());
              },
              renderSuccess: ({data}) {
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 15,
                  spacing: 15,
                  children: data["genres"]
                      .map<Widget>((genre) => GenreGridItem(genre))
                      .toList(),
                );
              }),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(25),
            child: Text(
              "TV Show Genres",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AsyncLoader(
              initState: () => APIHelper().getTVShowGenres(),
              renderLoad: () {
                return Center(child: CircularProgressIndicator());
              },
              renderSuccess: ({data}) {
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.center,
                  runSpacing: 15,
                  spacing: 15,
                  children: data["genres"]
                      .map<Widget>((genre) => GenreGridItem(genre))
                      .toList(),
                );
              }),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}
