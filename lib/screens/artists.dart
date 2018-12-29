import 'package:flutter/material.dart';
import '../widgets/horizontal_person_list.dart';
import '../helpers/api.dart';

class Artists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            HorizontalPersonList(
              title: "Trending Artists",
              dataSource: APIHelper().getTrendingArtist,
            ),
            HorizontalPersonList(
              title: "Popular Artists",
              dataSource: APIHelper().getPopularArtists,
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
