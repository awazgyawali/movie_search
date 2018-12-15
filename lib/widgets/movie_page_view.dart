import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import './page_transformer.dart';
import '../helpers/api.dart';

class MoviePageView extends StatelessWidget {
  const MoviePageView({this.dataSource});

  final dataSource;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: AsyncLoader(
        initState: dataSource,
        renderLoad: () => Center(child: CircularProgressIndicator()),
        renderSuccess: ({data}) {
          return PageTransformer(
            pageViewBuilder: (context, pageVResolver) {
              return PageView.builder(
                controller: PageController(viewportFraction: 0.80),
                itemBuilder: (context, index) {
                  var movie = data["results"][index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/movie/${movie["id"]}");
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(
                            APIHelper().getPosterUrl(movie["poster_path"]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: data["results"].length,
              );
            },
          );
        },
      ),
    );
  }
}
