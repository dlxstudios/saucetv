import 'package:flavor/web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'package:saucetv/MediaController.dart';


class SauceDetailsPage extends StatelessWidget {
  final ScrollController controller;

  const SauceDetailsPage({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final DataItem item = ModalRoute.of(context).settings.arguments;

    // var cover = item.data['fields']['cover_url']['stringValue'];
    // var videoUrl = item.data['fields']['video_url']['stringValue'];
    // var title = item.data['fields']['title']['stringValue'];
    // var aurthor = 'Gunna'; //item.data['fields']['title']['stringValue'];
    // var plays = '200k Plays'; //item.data['fields']['title']['stringValue'];
    // var avatarImageUrl = item.data['fields']['cover_url']['stringValue'];

// HomeTestData
    var cover = "item.data['cover']";
    var asset = "item.data['asset']";
    var title = "item.data['title']";
    var aurthor =
        "item.data['aurthor']"; //item.data['fields']['title']['stringValue'];
    var plays =
        "item.data['plays']"; //item.data['fields']['title']['stringValue'];
    var avatarImageUrl = "item.data['avatarImageUrl']";

    // print(item.data);

    // var logger = Logger();

    // logger.i(item.data);

    return Material(
      child: ListView(
        padding: EdgeInsets.all(0),
        controller: controller,
        // shrinkWrap: true,
        cacheExtent: 10,
        children: <Widget>[
// Header

          // AspectRatio(
          //   aspectRatio: 1.6,
          //   child: Image.network(
          //     cover,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          // VideoView(
          //   asset: asset,
          //   // network: videoUrl,
          //   cover: cover,
          // ),

          // SizedBox(
          //   height: 34,
          // ),

          // AspectRatio(
          //   aspectRatio: 16 / 9,
          //   child: Material(
          //     type: MaterialType.card,
          //     child: Stack(
          //       children: <Widget>[
          //         Opacity(
          //           opacity: 1,
          //           child: Container(color: Colors.tealAccent),
          //         )
          //       ],
          //     ),
          //   ),
          // ),

          SizedBox(
            height: 8,
          ),

          ListTile(
            title: Text(
              '$title',
              style: TextStyle(fontSize: 18),
              maxLines: 2,
            ),
            subtitle: Text('5.7k views'),
          ),

          // action bar
          Container(
            color: Colors.green,
            //  height: 200,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  avatarImageUrl != null ? NetworkImage(avatarImageUrl) : null,
            ),
            title: Text(
              '$aurthor',
              style: TextStyle(fontSize: 18),
              maxLines: 2,
            ),
            subtitle: Text('$plays'),
            trailing: FlatButton.icon(
              color: Colors.green,
              label: Container(
                child: Text('h'),
                width: 60,
              ),
              onPressed: () {},
              icon: Icon(Icons.settings_ethernet),
            ),
          ),
        ],
      ),
    );
  }
}
