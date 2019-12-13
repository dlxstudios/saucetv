import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:saucetv/MediaController.dart';
import 'package:saucetv/components/PlaybackControls.dart';

class SauceNowPlayingPage extends StatefulWidget {
  final IjkMediaController mediaController;

  const SauceNowPlayingPage({
    Key key,
    this.mediaController,
  }) : super(key: key);

  @override
  _SauceNowPlayingPageState createState() => _SauceNowPlayingPageState();
}

class _SauceNowPlayingPageState extends State<SauceNowPlayingPage> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => afterFirstLayout(context));
  }

  void afterFirstLayout(BuildContext context) {
    // this.mcontroller = Provider.of<MediaController>(context).controller;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('now was disposed');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: IjkPlayer(
            mediaController: widget.mediaController,
            controllerWidgetBuilder: (_con) {
              return Container();
            },
          ),
        ),
        Container(
          child: LinearProgressIndicator(),
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_previous),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_previous),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.play_arrow),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        ListTile(
          title: Text('Title'),
          subtitle: Text('By Whom'),
        ),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
