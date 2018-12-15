import 'package:flutter/material.dart';
import '../widgets/horizontal_movie_list.dart';
import '../widgets/horizontal_person_list.dart';

class ViewAllScreen extends StatefulWidget {
  final title, dataSource, artist;
  ViewAllScreen({this.title, this.dataSource, this.artist = false});
  _ViewAllScreenState createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  int page = 1;
  var movies = [];

  getMovie() {
    widget.dataSource(page: page).then((data) {
      setState(() {
        movies.addAll(data["results"]);
        page++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: BackButton()),
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index >= movies.length) {
                    getMovie();
                    return Center(child: CircularProgressIndicator());
                  } else if (widget.artist)
                    return PersonGridItem(movies[index]);
                  return MovieGridItem(movies[index]);
                },
                itemCount: movies.length + 1,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: .5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
