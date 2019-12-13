import 'package:saucetv/assets.dart';
import 'package:saucetv/customdrip.dart';
import 'package:flavor/utilities/AppSettings.dart';
import 'package:flavor/web/components/DLX/components.dart';
import 'package:flavor/web/components/Page/Page.dart';
import 'package:flavor/web/components/Tiles/Tiles.dart';
import 'package:flavor/components/Build/buildList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';

class DiscoverView extends StatefulWidget {
  @override
  _DiscoverViewState createState() => _DiscoverViewState();
}

class _DiscoverViewState extends State<DiscoverView> {
  ScrollController sc = ScrollController(keepScrollOffset: true);
  IjkMediaController controller = IjkMediaController();


  @override
  void initState() {
    super.initState();
//     controller.setNetworkDataSource(
//               'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
//               // 'rtmp://172.16.100.245/live1',
//               // 'https://www.sample-videos.com/video123/flv/720/big_buck_bunny_720p_10mb.flv',
// //              "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
//               // 'http://184.72.239.149/vod/smil:BigBuckBunny.smil/playlist.m3u8',
//               // "file:///sdcard/Download/Sample1.mp4",
//               autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    // var _list1 = List.generate(10, (i) {
    //   return ListTile(
    //     title: Text('oioioi $i'),
    //   );
    // });

    // var _list2 = List.generate(10, (i) {
    //   return ThumbTile(
    //     cover: '',
    //     title: 'gfdgfd $i',
    //     borderRadius: 0,
    //   );
    // });

    return PageShell(
      child: CustomScrollView(
        controller: sc,
        slivers: <Widget>[
          // DiscoverViewAppBar(),
          // DLXSliverAppBar(
          //   title: FlatButton(
          //     onPressed: (){},
          //     child: Text('Search'),
          //   ),
          // ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 300,
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: Stack(
                  children: <Widget>[
                    IjkPlayer(
                      
                      mediaController: controller,
                    ),

                   

                    
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(10),
              height: 300,
              child: Card(
                color: Colors.amber.shade700,
                margin: EdgeInsets.all(10),
                elevation: 10,
              ),
            ),
          ),

          // BuildList(controller: sc, items: _list1),
          // BuildList(controller: sc, items: _list2)
        ],
      ),
    );
  }
}

class DiscoverViewAppBar extends StatelessWidget {
  const DiscoverViewAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 160,
      floating: true,
      flexibleSpace: Container(
        // height: 200,
        // color: Colors.white,
        child: CustomPaint(
          child: Container(
              // height: 200.0,
              ),
          painter: SauceDrip(),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: Hero(
      //   tag: 'saucetvlogo',
      //   child: Container(
      //     // height: 60,
      //     // color: Colors.blueGrey,
      //     child: ImageAssets.sauceTvLogo,
      //   ),
      // ),
      actions: <Widget>[
        IconButton(
          icon: CircleAvatar(
            child: ImageAssets.sauceTvLogo,
          ),
          onPressed: () {
            var sett = Provider.of<AppSettingsModel>(context);
            // sett.pushTo('profile', context);
          },
        )
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Search'),
        ],
      ),
      centerTitle: true,
    );
  }
}
