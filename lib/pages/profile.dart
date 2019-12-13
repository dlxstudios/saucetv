import 'package:flavor/utilities/AppSettings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PageProfile extends StatefulWidget {
  @override
  _PageProfileState createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Hero(
      //   tag: 'userprofilepic',
      //   child: AspectRatio(
      //     aspectRatio: 16 / 9,
      //     child: Image.asset('assets/media/kdot.jpg'),
      //   ),
      // ),

      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),

      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: 'userprofilepic',
              child: Image.asset('assets/media/kdot.jpg'),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: .6,
              minChildSize: .6,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Container(
                    // color: Colors.red,
                    child: Material(
                      elevation: 0,
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(60),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 16,
                          ),
                          ListTile(
                            title: Text('Fly shit setting!'),
                          ),
                          ListTile(
                            title: Text('Change this, it;s dope'),
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(20),
                            color: Colors.amber,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(20),
                            color: Colors.amber,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(20),
                            color: Colors.amber,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(20),
                            color: Colors.amber,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(20),
                            color: Colors.amber,
                          ),
                          Container(
                            height: 300,
                            margin: EdgeInsets.all(20),
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//  Hero(
//               tag: 'userprofilepic',
//               child: Image.asset('assets/media/kdot.jpg'),
//             ),
