import 'package:flavor/web/components/Tiles/Tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saucetv/MediaController.dart';
import 'package:saucetv/components/MediaTile.dart';
import 'package:saucetv/controllers/ApiController.dart';
import 'package:saucetv/customdrip.dart';

class SauceHome extends StatefulWidget {
  final MediaController mediaController;
  final ApiController api;
  const SauceHome({
    Key key,
    this.mediaController,
    this.api,
  }) : super(key: key);
  @override
  _SauceHomeState createState() => _SauceHomeState();
}

class _SauceHomeState extends State<SauceHome> {
  PageController _playlistController;
  List<Playlist> playlists = [];
  int _pageSelected = 0;
  @override
  void initState() {
    super.initState();

    // playlists = widget.api.playlists;
    // print(playlists.length);
  }

  @override
  void dispose() {
    super.dispose();
    widget.mediaController.dispose();
  }

  void onPlaylistPageViewChange(int value) {
    setState(() {
      _pageSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = widget.api.playlists;

    _playlistController = PageController(
      initialPage: _pageSelected,
      keepPage: true,
      viewportFraction: .6,
    );

    List<Widget> _pages = [];

    playlists.map((playlist) {
      _pages.add(SliverToBoxAdapter(
        child: Container(
          height: 400,
          child: TrackListPageView(
            mediaController: widget.mediaController,
            tracks: playlist.tracks,
            title: playlist.title,
          ),
        ),
      ));
    }).toList();

    // _pages.insert(
    //   0,
    //   SliverToBoxAdapter(
    //     child: Container(
    //       margin: EdgeInsets.only(bottom: 60),
    //       child: CustomPaint(
    //         child: AnimatedContainer(
    //           duration: Duration(milliseconds: 300),
    //           height: 100,
    //           color: Colors.transparent,
    //         ),
    //         painter: SauceDrip(),
    //       ),
    //     ),
    //   ),
    // );

    _pages.insert(
      0,
      SliverAppBar(
        backgroundColor: Colors.transparent,
        // title: Text('Floating app bar'),
        floating: true,
        flexibleSpace: CustomPaint(
          child: Container(
            // duration: Duration(milliseconds: 300),
            height: 300,
          ),
          painter: SauceDrip(),
        ),
        expandedHeight: 200,
      ),
    );

    return Scaffold(
      body: CustomScrollView(slivers: _pages),
      drawer: SauceMenu(),

    );
  }
}

// SliverToBoxAdapter(
//               child: Container(
//                 height: size.maxHeight,
//                 width: size.maxWidth,
//                 child: PageView(
//                   onPageChanged: onPlaylistPageViewChange,
//                   scrollDirection: Axis.vertical,
//                   controller: _playlistController,
//                   children: playlists.map((playlist) {
//                     Padding(
//                       padding: const EdgeInsets.all(0.0),
//                       child: TrackListPageView(
//                           mediaController: widget.mediaController,
//                           tracks: playlist.tracks),
//                     );
//                   }).toList(),
//                 ),
//               ),
//             )

// Stack(
//         children: <Widget>[
//           Positioned.fill(
//             child: ,
//           )
//           // Positioned.fill(
//           //   child: TrackListPageView(
//           //     mediaController: widget.mediaController,
//           //   ),
//           // ),
//           // Align(
//           //   alignment: Alignment.centerLeft,
//           //   child: Padding(
//           //     padding: const EdgeInsets.only(
//           //       left: 0,
//           //     ),
//           //     child: Column(
//           //       crossAxisAlignment: CrossAxisAlignment.center,
//           //       mainAxisAlignment: MainAxisAlignment.center,
//           //       children: tracks.map((_) {
//           //         return Container(
//           //           // color: Colors.blueGrey,
//           //           height: 10,
//           //           width: 10,
//           //           margin: EdgeInsets.all(10),
//           //           child: Material(
//           //             borderRadius: BorderRadius.circular(10),
//           //             clipBehavior: Clip.antiAlias,
//           //             elevation: 6,
//           //           ),
//           //         );
//           //       }).toList(),
//           //     ),
//           //   ),
//           // )
//         ],
//       ),

class TrackListPageView extends StatefulWidget {
  final MediaController mediaController;
  final List<Track> tracks;
  final String title;
  const TrackListPageView({
    Key key,
    this.mediaController,
    this.tracks,
    this.title,
  }) : super(key: key);

  @override
  _TrackListPageViewState createState() => _TrackListPageViewState();
}

class _TrackListPageViewState extends State<TrackListPageView> {
  PageController _trackListController;

  @override
  void initState() {
    super.initState();
  }

  void _pageChange(int ind) {
    // widget.mediaController.setController(network: tracks[ind].video_url);
    // widget.mediaController.setController(
    //     asset: 'assets/media/Jumpin.m4a', media: widget.tracks[ind]);
  }

  @override
  Widget build(BuildContext context) {
    _trackListController =
        PageController(initialPage: 0, keepPage: true, viewportFraction: .8);

    return LayoutBuilder(builder: (context, size) {
      // print(size.maxWidth);
      return Container(
        // color: Colors.orange,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: <Widget>[
            Container(
              height: 48,
              // color: Colors.pink,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  widget.title != null
                      ? Text(
                          widget.title,
                          style: Theme.of(context).textTheme.display1,
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              height: size.maxWidth - 120,
              child: PageView(
                controller: this._trackListController,
                onPageChanged: _pageChange,
                scrollDirection: Axis.horizontal,
                children: widget.tracks.map((track) {
                  var cover = track.cover_url;
                  var title = 'track.title';
                  var network = track.video_url;
                  var time = track.updatedAt;
                  return Container(
                    margin: EdgeInsets.all(16),
                    child: Stack(
                      children: <Widget>[
                        PlayListTile(
                          // title: title,
                          // subtitle: 'DJ Sizzur',
                          // borderRadius: 0,
                          media: track,
                          network: track.video_url,
                          cover: track.cover_url,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: ListTile(
                            title: Text(
                              title,
                              style: Theme.of(context).textTheme.headline,
                            ),
                            subtitle: Text(
                              'DJ Sizzur',
                              style: Theme.of(context).textTheme.title,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class PlayListTile extends StatefulWidget {
  final Media media;
  final String cover;
  final String title;
  final String subtitle;

  final double borderRadius;

  final String network;
  const PlayListTile({
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

class _PlaybackTileState extends State<PlayListTile> {
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
                      // setState(() {
                      //   loading = true;
                      //   mediaController
                      //       .setController(
                      //           // network: widget.network,
                      //           asset: 'assets/media/Jumpin.m4a',
                      //           media: widget.media)
                      //       .then((r) {
                      //     // log.e(r);
                      //     mediaController.play();
                      //     loading = false;
                      //   });
                      // });
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

class SauceMenu extends StatefulWidget {
  @override
  _SauceMenuState createState() => _SauceMenuState();
}

class _SauceMenuState extends State<SauceMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              // color: Colors.lightBlue,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.playlist_play),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              // color: Colors.lightBlue,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              // color: Colors.lightBlue,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('profile');
                },
                child: Hero(
                  tag: 'userprofilepic',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/media/kdot.jpg'),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(8),
              // color: Colors.lightBlue,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
