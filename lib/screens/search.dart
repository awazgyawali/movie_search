import 'package:flutter/material.dart';

import '../widgets/search_item.dart';

class SearchScreen extends StatefulWidget {
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Result",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("200 Search Results")
                ],
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.only(top: 5, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Search movies, series or actors"),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 20,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: SearchMovieItem(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: SearchMovieItem(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: SearchMovieItem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
