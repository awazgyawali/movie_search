import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
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
      print(data);
      setState(() {
        movieDetail = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Movie Name",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    label: Text(
                      "4.3",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    icon: Icon(
                      Icons.star,
                    ),
                    textColor: Colors.amber,
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Expanded(
              child: movieDetail != null
                  ? SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 300,
                            color: Colors.black,
                          ),
                          Container(
                            height: 180,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  APIHelper()
                                      .getPosterUrl(movieDetail["poster_path"]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
