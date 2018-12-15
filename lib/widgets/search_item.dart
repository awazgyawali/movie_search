import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../helpers/api.dart';

class SearchMovieItem extends StatefulWidget {
  _SearchMovieItemState createState() => _SearchMovieItemState();
}

class _SearchMovieItemState extends State<SearchMovieItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 180,
          width: 110,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "https://avatars1.githubusercontent.com/u/10810343?s=460&v=4",
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Expanded(
          child: Container(
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Creed 2",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      color: Theme.of(context).accentColor,
                      onPressed: () {},
                    )
                  ],
                ),
                Expanded(flex: 2, child: SizedBox()),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.watch_later,
                      size: 16,
                      color: Theme.of(context).accentColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "1h 12m",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: <Widget>[
                    Expanded(child: Text("Action")),
                    Expanded(flex: 2, child: Text("Otto Bathurst")),
                    Expanded(child: Text("2018")),
                  ],
                ),
                Expanded(child: SizedBox()),
                Row(
                  children: <Widget>[
                    StarRating(
                      size: 25,
                      starCount: 5,
                      rating: 3,
                      color: Colors.amber,
                      borderColor: Colors.amber,
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
        )
      ],
    );
  }
}
