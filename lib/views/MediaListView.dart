import 'package:flutter_ijkplayer/src/ijkplayer.dart';
import 'package:saucetv/components/MediaTile.dart';
import 'package:saucetv/controllers/ApiController.dart';
import 'package:flavor/components/Build/BuildPage.dart';
import 'package:flavor/device/components/Tiles/Tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MusicListView extends StatelessWidget {
  final IjkMediaController mediaController;
  MusicListView({
    Key key, this.mediaController, 
  }) : super(key: key); 

  List<Widget> musicListViewItems = [];
  //  = List.generate(20, (i) {
  //   return PageViewItem(
  //     cover: data.data['cover'],
  //     title: data.data["title"],
  //     subtitle: data.data["subtitle"],
  //     data: data,
  //     borderRadius: 0,
  //   );
  // });

  @override
  Widget build(BuildContext context) {
    // var nav = Provider.of<AppSettingsModel>(context).nav;
    List<Widget> allcomps = [];

    List<Track> items = Provider.of<ApiController>(context).tracks;

    for (var item in items) {
      var cover = item.cover_url;
      var title = item.title; 
      var network = item.video_url;
      var time = item.updatedAt;

      // print(time);

      allcomps.add(SliverToBoxAdapter(
        child: Container(
          // margin: EdgeInsets.all(8),
          height: 350,
          // width: 3000,
          // color: Colors.orange,
          child: PlaybackTile(
            borderRadius: 0,
            media: item,
            network: item.video_url,
            cover : item.cover_url
          ),

          // child: ListTile(
          //   leading: Text('data')
          // ),
        ),
      ));
    }

    // allcomps.add(
    //   SliverToBoxAdapter(
    //     child: SizedBox(
    //       height: 81,
    //     ),
    //   ),
    // );

    return BuildPage(
      // color: Colors.primaries[0].shade500,
      components: allcomps,
    );

    // return CustomScrollView(
    //   cacheExtent: 20,
    //   primary: true,
    //   slivers: allcomps
    //     ..insert(
    //       0,
    //       SliverToBoxAdapter(
    //           child: SizedBox(
    //         height: 96,
    //       )),
    //     ),
    //   // slivers: [],
    //   // ),
    // );
  }
}
