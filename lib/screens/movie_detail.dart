import 'package:flutter/material.dart';
import '../helpers/api.dart';

class MovieDetail extends StatefulWidget {
  final movieId;
  MovieDetail(this.movieId);
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  var movieDetail;
  @override
  void initState() {
    super.initState();
    APIHelper().getMovieDetail(widget.movieId).then((data) {
      setState(() {
        movieDetail = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: movieDetail != null
          ? Column(
              children: <Widget>[
                Container(
                  height: 180,
                  width: 110,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        APIHelper().getPosterUrl(movieDetail["poster_path"]),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
