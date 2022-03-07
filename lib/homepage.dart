import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:randomusers/detailpage.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'content.dart';
import 'detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = "https://randomuser.me/api/?results=50";
  bool isLoading = true;
  late List usersData;
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  Future getData() async {
    var response = await http.get(
      Uri.parse(url),
      headers: {"Accept": "application/json"},
    );

    List data = jsonDecode(response.body)['results'];
    setState(() {
      usersData = data;

      if (usersData.isNotEmpty) {
        for (int i = 0; i < usersData.length; i++) {
          _swipeItems.add(SwipeItem(
              // content: Content(text: _names[i], color: _colors[i]),
              content: Content(text: usersData[i]['name']['first']),
              likeAction: () {
                _scaffoldKey.currentState?.showSnackBar(const SnackBar(
                  content: Text("Liked "),
                  //  content: Text("Liked ${_names[i]}"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              nopeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Nope ${usersData[i]['name']['first']}"),
                  duration: const Duration(milliseconds: 500),
                ));
              },
              superlikeAction: () {
                _scaffoldKey.currentState?.showSnackBar(SnackBar(
                  content: Text("Superliked ${usersData[i]['name']['first']}"),
                  duration: const Duration(milliseconds: 500),
                ));
              },
              onSlideUpdate: (SlideRegion? region) async {
                print("Region $region");
              }));
        } //for loop
        _matchEngine = MatchEngine(swipeItems: _swipeItems);
        isLoading = false;
      } //if
    }); // setState
  } // getData

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.indigo[50],
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        toolbarHeight: 72.0,
        titleSpacing: 36.0,
        title: const Text(
          'Discover',
          style: TextStyle(
              fontSize: 30.0,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 16.0, 0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.format_align_left_rounded,
                color: Colors.deepPurple,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: SwipeCards(
                        matchEngine: _matchEngine!,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Card(
                                margin: const EdgeInsets.all(16.0),
                                shadowColor: Colors.deepPurple,
                                elevation: 12.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24.0),
                                    child: Image.network(
                                      // "https://images.pexels.com/photos/3532552/pexels-photo-3532552.jpeg?cs=srgb&dl=pexels-hitesh-choudhary-3532552.jpg&fm=jpg",
                                      usersData[index]['picture']['large'],

                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20.0),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(24.0)),
                                    color: Colors.black26),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  // alignment: Alignment.bottomCenter,
                                  height: 72.0,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(24.0),
                                        bottomRight: Radius.circular(24.0),
                                      ),
                                      color: Colors.white24),
                                  margin: const EdgeInsets.fromLTRB(
                                      24.0, 40.0, 24.0, 24.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                usersData[index]['name']
                                                        ['first'] +
                                                    ", " +
                                                    usersData[index]['dob']
                                                            ['age']
                                                        .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Text(
                                                usersData[index]['location']
                                                        ['city'] +
                                                    ", " +
                                                    usersData[index]['location']
                                                        ['country'],
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                softWrap: false,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton.icon(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPage(
                                                  name: usersData[index]['name']
                                                      ['first'],
                                                  age: usersData[index]['dob']
                                                          ['age']
                                                      .toString(),
                                                  gender: usersData[index]
                                                      ['gender'],
                                                  city: usersData[index]
                                                      ['location']['city'],
                                                  state: usersData[index]
                                                      ['location']['state'],
                                                  country: usersData[index]
                                                      ['location']['country'],
                                                  phone: usersData[index]
                                                          ['phone']
                                                      .toString(),
                                                  email: usersData[index]
                                                      ['email'],
                                                  avatar: usersData[index]
                                                      ['picture']['large'],
                                                ),
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.directions_sharp,
                                            color: Colors.white,
                                          ),
                                          label: const Text(
                                            "Profile",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                              overflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                            elevation: 8.0,
                                            shadowColor: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        onStackFinished: () {
                          _scaffoldKey.currentState!
                              .showSnackBar(const SnackBar(
                            content: Text("Stack Finished"),
                            duration: Duration(milliseconds: 500),
                          ));
                        },
                        itemChanged: (SwipeItem item, int index) {
                          print("item: ${item.content.text}, index: $index");
                        },
                        upSwipeAllowed: true,
                        fillSpace: true,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.thumb_down_alt_rounded,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _matchEngine!.currentItem?.nope();
                            },
                            // child: const Text("Nope"),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          radius: 36.0,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 32.0,
                            backgroundColor: Colors.deepPurple,
                            child: Center(
                              child: IconButton(
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 36.0,
                                ),
                                onPressed: () {
                                  _matchEngine!.currentItem?.superLike();
                                },
                                //child: const Text("Superlike"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black,
                                spreadRadius: 2)
                          ],
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.thumb_up_alt_rounded,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              _matchEngine!.currentItem?.like();
                            },
                            //  child: const Text("Like"),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
      bottomNavigationBar: SizedBox(
        height: 72,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.deepPurple,
            unselectedItemColor: Colors.purple[200],
            iconSize: 24.0,
            enableFeedback: true,
            mouseCursor: MouseCursor.uncontrolled,
            elevation: 16.0,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Container(
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.home,
                      size: 36,
                      color: Colors.white,
                    ),
                  ),
                ),
                label: "Home",
              ),
              const BottomNavigationBarItem(
                label: "Matches",
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurple,
                ),
              ),
              const BottomNavigationBarItem(
                  label: "Settings",
                  icon: Icon(
                    Icons.settings,
                    color: Colors.deepPurple,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
