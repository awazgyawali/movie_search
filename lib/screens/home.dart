import 'package:flutter/material.dart';
import './movies.dart';
import './tv_shows.dart';
import './artists.dart';
import './genres.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  var name = ["Movies", "TV Shows"];
  var _pageController = PageController();

  double miliseconds(int index) => ((index - _pageController.page) * 200).abs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(
              milliseconds: 300,
            ),
            curve: Curves.easeIn,
          );
        },
        fixedColor: Colors.amber,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.movie),
            title: Text("Movies"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.live_tv),
            title: Text("TV Shows"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.supervisor_account),
            title: Text("Artists"),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).accentColor,
            icon: Icon(Icons.list),
            title: Text("Genres"),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Movies(),
            TVShows(),
            Artists(),
            Genres(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selectedIndex < 2
          ? FloatingActionButton.extended(
              icon: Icon(Icons.search),
              label: Text("Search ${name[selectedIndex]}"),
              onPressed: () {
                Navigator.of(context).pushNamed("/search");
              },
            )
          : null,
    );
  }
}

class HomeToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Now Playing ...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text("Welcome home")
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            iconSize: 50,
            onPressed: () {
              Navigator.pushNamed(context, "/signin");
            },
          ),
          // InkResponse(
          //   highlightShape: BoxShape.circle,
          //   onTap: () {
          //     Navigator.pushNamed(context, "/myprofile");
          //   },
          //   child: CircleAvatar(
          //     radius: 25,
          //     backgroundImage: NetworkImage(
          //       "https://avatars1.githubusercontent.com/u/10810343?s=460&v=4",
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
