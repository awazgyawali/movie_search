import 'package:flutter/material.dart';
import 'package:async_loader/async_loader.dart';

import '../helpers/api.dart';

class HorizontalPersonList extends StatelessWidget {
  final title, dataSource;
  HorizontalPersonList({this.title, this.dataSource});

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
                  children: data["results"]
                      .map<Widget>(
                        (person) => PersonGridItem(person),
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

class PersonGridItem extends StatelessWidget {
  final person;
  PersonGridItem(this.person);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  APIHelper().getPosterUrl(person["profile_path"]),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            person["name"],
            maxLines: 2,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
