import 'package:saucetv/controllers/ApiController.dart';
import 'package:flavor/components/Build/buildPageView.dart';
//
import 'package:flavor/utilities/AppSettings.dart';
import 'package:flavor/components/Build/buildGrid.dart';
import 'package:flavor/web/components/DLX/components.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:saucetv/components/MediaTile.dart';
import '../assets.dart';
import '../customdrip.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key key,
  }) : super(key: key);

  PageController _headerPageController = PageController(
    keepPage: true,
    initialPage: 0,
    viewportFraction: .7,
  );

  List<Widget> _homeHeaderViewItems = [
    // Container(
    //   color: Colors.green,
    //   width: 200,
    //   height: 200,
    // ),
  ];
  //  = List.generate(20, (i) {
  //   return PageViewItem(
  //     cover: data.data['cover'],
  //     title: data.data["title"],
  //     subtitle: data.data["subtitle"],
  //     data: data,
  //   );
  // });

  List<Widget> _homeGridViewItems = [
    //  Container(
    //   color: Colors.green,
    //   width: 200,
    //   height: 200,
    // ),
  ];
  // = List.generate(4, (i) {
  //   return PageViewItem(
  //     cover: data.data['cover'],
  //     title: data.data["title"],
  //     subtitle: data.data["subtitle"],
  //     data: data,
  //   );
  // });

  @override
  Widget build(BuildContext context) {
    var screen = ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);

    // print(data);

    List<Track> items = Provider.of<ApiController>(context).tracks;

    for (var i = 0; i < 5; i++) {
      // print(items[i].data);

      // var cover =
      //     'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_SX300.jpg';
      var cover = items[i].cover_url;
      var title = items[i].title;
      var network = items[i].video_url;
      var time = items[i].createdAt;
      var data = items[i].json;

      // print(time);

      _homeHeaderViewItems.add(MediaTile(
          cover: cover,
          title: title,
          subtitle: time.toString(),
          media: items[i],
          network: network));
    }

    for (var i = 5; i < 9; i++) {
      // print(items[i].data);

      // var cover =
      //     'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_SX300.jpg';
      var cover = items[i].cover_url;
      var title = items[i].title;
      var network = items[i].video_url;
      var time = items[i].updatedAt;
      var data = items[i].json;

      // print(time);

      _homeGridViewItems.add(MediaTile(
          cover: cover,
          title: title,
          subtitle: time.toString(),
          media: items[i],
          network: network));
    }

    return Container(
      // color: Colors.indigoAccent,

      child: CustomScrollView(
        // primary: true,
        // padding: EdgeInsets.all(16),
        // cacheExtent: 6,
        slivers: <Widget>[
          // new HomeViewAppBar(),

          // DLXSliverAppBar(
          //   floating: true,
          // ),

          SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Featured',
                    style: TextStyle(
                      // color: Colors.red,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          new BuildPageView(
            pageController: _headerPageController,
            items: _homeHeaderViewItems,
            itemPadding: EdgeInsets.only(top: 16, right: 16, bottom: 16),
          ),

          SliverToBoxAdapter(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    'Hot',
                    style: TextStyle(
                      // color: Colors.red,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),

          BuildGrid(
            crossAxisCount: 4,
            items: _homeGridViewItems,
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 190,
            ),
          ),
        ],
      ),
    );
  }
}
