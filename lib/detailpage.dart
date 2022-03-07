import 'package:flutter/material.dart';
import 'dart:ui';

class DetailsPage extends StatefulWidget {
  final String name, gender, city, state, country, email, avatar, age, phone;

  const DetailsPage({
    Key? key,
    required this.name,
    required this.age,
    required this.gender,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.email,
    required this.avatar,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight - 32),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6 - 36,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Card(
                    shadowColor: Colors.deepPurpleAccent,
                    elevation: 16.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24.0),
                        child: Image.network(
                          widget.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        color: Colors.black12),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 48,
                          margin: const EdgeInsets.all(32.0),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.white24),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          margin: const EdgeInsets.all(32.0),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              color: Colors.white24),
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu_outlined,
                                color: Colors.white70,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 72,
                            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(24.0),
                                bottomRight: Radius.circular(24.0),
                              ),
                              // Clip it cleanly.
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  color: Colors.grey.withOpacity(0.1),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.all(24.0),
                                        child: const Text(
                                          'It can be a match !',
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 24, 0),
                                        child: Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.mark_chat_read_rounded,
                                              color: Colors.white,
                                            ),
                                            label: const Text(
                                              "Say Hi",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              elevation: 8.0,
                                              shadowColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: Text(
                          widget.name + ", " + widget.age,
                          style: const TextStyle(
                            color: Colors.black87,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(0.0),
                        child: Text(
                          widget.city +
                              " " +
                              widget.state +
                              " ," +
                              widget.country,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 36,
                    width: 48,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        color: Colors.black12),
                    child: Icon(
                      widget.gender == 'male' ? Icons.male : Icons.female,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 0),
              child: SizedBox(
                height: 150,
                child: Card(
                  color: Colors.white,
                  shadowColor: Colors.deepPurple[300],
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(16),
                        child: const Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.fade),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(24, 12, 0, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.phone,
                                  color: Colors.deepPurple,
                                ),
                                Text(
                                  widget.phone,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12.0,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 12, 24, 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Icon(
                                  Icons.email_rounded,
                                  color: Colors.deepPurple,
                                ),
                                Text(
                                  widget.email,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    overflow: TextOverflow.fade,
                                    fontSize: 12.0,
                                  ),
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              child: Row(
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
                          // _matchEngine!.currentItem?.nope();
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
                              //  _matchEngine!.currentItem?.superLike();
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
                          //_matchEngine!.currentItem?.like();
                        },
                        //  child: const Text("Like"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
