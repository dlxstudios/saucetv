import 'package:flutter_ijkplayer/flutter_ijkplayer.dart';
import 'package:saucetv/MediaController.dart';
import 'package:saucetv/components/PlaybackControls.dart';
import 'package:saucetv/controllers/ApiController.dart';
import 'package:flavor/web/components/Tiles/Tiles.dart';
import 'package:flavor/web/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class PlaybackTile extends StatefulWidget {
  final Media media;
  final String cover;
  final String title;
  final String subtitle;

  final double borderRadius;

  final String network;
  const PlaybackTile({
    Key key,
    this.borderRadius = 28,
    this.network,
    this.media,
    this.cover,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  _PlaybackTileState createState() => _PlaybackTileState();
}

class _PlaybackTileState extends State<PlaybackTile> {
  var log = Logger();

  bool match = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var mediaController = Provider.of<MediaController>(context);

    if (mediaController.nowPlaying != null) {
      match = mediaController.nowPlaying == this.widget.media;
    }

    // log.i(this.widget.data.data);
    // log.e(widget.cover);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          bottom: 0.0,
          child: new ThumbTile(
            borderRadius: widget.borderRadius,
            title: widget.title,
            subtitle: widget.subtitle,
            cover: widget.cover,
            elevation: match ? 8 : 0,
          ),
        ),
        !match
            ? Positioned.fill(
                child: new Material(
                  elevation: 0,
                  borderRadius:
                      BorderRadiusDirectional.circular(widget.borderRadius),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.transparent,
                  child: new InkWell(
                    // splashColor: Colors.red,
                    // onTap: () => Provider.of<AppSettingsModel>(context)
                    //     .pushTo('details', context, data: data),

                    onTap: () {
                      // log.e(this.data.data['asset']);
                      // log.e(widget.network);
                      setState(() {
                        loading = true;
                        mediaController
                            .setController(
                                // network: widget.network,
                                asset: 'assets/media/Jumpin.m4a',
                                media: widget.media)
                            .then((r) {
                          // log.e(r);
                          mediaController.play();
                          loading = false;
                        });
                      });
                    },
                    child: loading
                        ? ShimmerPlaceholder()
                        // child: Container(),

                        : Container(),
                  ),
                ),
              )
            : Container(),
        // match
        //     ? Positioned.fill(
        //         child: Container(
        //           color: Theme.of(context).canvasColor.withOpacity(.2),
        //           child: PlayPauseButton(iconSize: 60),
        //         ),
        //       )
        //     : Container(),

        // match
        //     ? Positioned.fill(
        //         child: IjkPlayer(
        //         mediaController: mediaController.controller,
        //         controllerWidgetBuilder: (_con) {
        //           return DefaultIJKControllerWidget(
        //             controller: _con,
        //             horizontalGesture: false,
        //             verticalGesture: false,
        //             playWillPauseOther: true,
        //           );
        //         },
        //         // controllerWidgetBuilder: (_con){
        //         //   return Container(
        //         //     child: Text('${_con.videoInfo.duration}'),
        //         //   );

        //         // },
        //       ))
        //     : Container(),
      ],
    );
  }
}

class MediaTile extends StatefulWidget {
  final String title;
  final String subtitle;
  final String cover;

  final Media media;

  final double borderRadius;

  final String network;
  const MediaTile(
      {Key key,
      this.title = '',
      this.subtitle = '',
      this.cover = '',
      this.borderRadius = 28,
      this.network,
      this.media})
      : super(key: key);

  @override
  _MediaTileState createState() => _MediaTileState();
}

class _MediaTileState extends State<MediaTile> {
  var log = Logger();

  bool match = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var mediaController = Provider.of<MediaController>(context);

    if (mediaController.nowPlaying != null) {
      // log.e(mediaController.nowPlaying.data['id']);

      // match = mediaController.nowPlaying.data['id'] == this.data.data['id'];
      match = mediaController.nowPlaying == this.widget.media;
      // log.e(match);
    }

    // log.i(this.widget.data.data);
    // log.e(widget.cover);

    return Stack(
      children: <Widget>[
        Positioned.fill(
          bottom: 0.0,
          child: new ThumbTile(
            title: widget.title,
            borderRadius: widget.borderRadius,
            subtitle: widget.subtitle,
            // data: widget.media.json,
            cover: widget.cover,
            elevation: match ? 8 : 0,
          ),
        ),
        !match
            ? Positioned.fill(
                child: new Material(
                  elevation: 0,
                  borderRadius:
                      BorderRadiusDirectional.circular(widget.borderRadius),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.transparent,
                  child: new InkWell(
                    // splashColor: Colors.red,
                    // onTap: () => Provider.of<AppSettingsModel>(context)
                    //     .pushTo('details', context, data: data),

                    onTap: () {
                      // log.e(this.data.data['asset']);
                      // log.e(widget.network);
                      setState(() {
                        loading = true;
                        mediaController
                            .setController(
                                network: widget.network,
                                // asset: this.widget.data.data['asset'],
                                media: widget.media)
                            .then((r) {
                          // log.e(r);
                          mediaController.play();
                          loading = false;
                        });
                      });
                    },
                    child: loading
                        ? ShimmerPlaceholder()
                        // child: Container(),

                        : Container(),
                  ),
                ),
              )
            : Container(),
        match
            ? Positioned.fill(
                child: Container(
                  color: Theme.of(context).canvasColor.withOpacity(.2),
                  child: PlayPauseButton(iconSize: 60),
                ),
              )
            : Container(),
      ],
    );
  }
}
