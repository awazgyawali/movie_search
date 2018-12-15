import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import '../helpers/api.dart';

class HorizontalGenreList extends StatelessWidget {
  final title, dataSource;
  HorizontalGenreList({this.title, this.dataSource});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(25, 10, 15, 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                child: Text("View All"),
                textColor: Theme.of(context).accentColor,
                onPressed: () {},
              )
            ],
          ),
        ),
        AsyncLoader(
          initState: () => dataSource(),
          renderLoad: () {
            return Container(
              height: 180,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          },
          renderSuccess: ({data}) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.fromLTRB(25, 0, 0, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: data["genres"]
                      .map<Widget>(
                        (person) => GenreGridItem(person),
                      )
                      .toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class GenreGridItem extends StatelessWidget {
  final genre;
  GenreGridItem(this.genre);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          genre["name"],
          overflow: TextOverflow.fade,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
