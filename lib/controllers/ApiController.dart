import 'package:flutter/foundation.dart';
import 'package:flavor/web/utils/utils.dart';

String apiRoot =
    'https://firestore.googleapis.com/v1/projects/dlxstudios-f6e64/databases/(default)/documents/';

class ApiController extends ChangeNotifier {
  get user => {
        "id": 3207,
        "kind": "user",
        "permalink": "jwagener",
        "username": "Johannes Wagener",
        "uri": "https://api.soundcloud.com/users/3207",
        "permalink_url": "https://soundcloud.com/jwagener",
        "avatar_url":
            "https://i1.sndcdn.com/avatars-000014428549-3at7qc-large.jpg?5e64f12"
      };

  List<Track> _tracks = [];
  List<Track> get tracks => _tracks;

  List<Playlist> _playlists = [];
  List<Playlist> get playlists => _playlists;

  Future getTrackList() async {
    return fetch('$apiRoot\media_test').then((jsonData) {
      // console.e(jsonData);
      List _items = jsonToList(jsonData, 'documents');
      _items.forEach((item) {
        _tracks.add(Track.fromJsonFS(item));
      });

      // Playlist 1
      List<Track> p1tracks = [];
      for (var i = 0; i < 5; i++) {
        p1tracks.add(_tracks[i]);
      }

      this._playlists.add(Playlist(tracks: p1tracks, title: 'HypeMix'));

      // Playlist 2
      List<Track> p2tracks = [];
      for (var i = 5; i < 11; i++) {
        p2tracks.add(_tracks[i]);
      }

      this._playlists.add(Playlist(tracks: p2tracks, title: 'Str8 Fire'));

      // Playlist 1
      List<Track> p3tracks = [];
      for (var i = 12; i < 15; i++) {
        p3tracks.add(_tracks[i]);
      }

      this
          ._playlists
          .add(Playlist(tracks: p3tracks, title: "Crunk Ain't Dead"));

      // Playlist 2
      List<Track> p4tracks = [];
      for (var i = 15; i < tracks.length; i++) {
        p4tracks.add(_tracks[i]);
      }

      this._playlists.add(Playlist(tracks: p4tracks, title: 'Fuego'));

      notifyListeners();
    });
  }

  ApiController() {
    this.getTrackList();
    // console.e('ApiController');
    // console.e(this.playlists);
  }
}

abstract class Media {}

class Track extends Media {
  String title;
  String aurthor;
  List<String> featuring;

  ///
  String cover_url;
  String video_url;

  ///
  double duration;

  ///
  String id;
  int plays;
  int favoritings_count;
  List<String> categories;

  ///
  String user;

  ///
  DateTime createdAt;
  DateTime updatedAt;
  Map<String, dynamic> json;

  Track();

  Track.fromJson(this.json) {
    // print(json);
    this.title = this.json.containsKey('title') ? this.json['title'] : null;
    // print(this.title);
  }

  Track.fromJsonFS(this.json) {
    this.title = getStringValueFS(this.json, 'title');
    // print(this.title);
    this.aurthor = getStringValueFS(this.json, 'aurthor');

    this.featuring = [getStringValueFS(this.json, 'featuring')];

    this.cover_url = getStringValueFS(this.json, 'cover_url');

    this.video_url = getStringValueFS(this.json, 'video_url');

    this.duration = getDoubleValueFS(this.json, 'duration') ?? 0;

    this.plays = getIntValueFS(this.json, 'plays') ?? 0;

    this.favoritings_count = getIntValueFS(this.json, 'favoritings_count');

    this.categories = [getStringValueFS(this.json, 'categories')];

    this.createdAt = getDateValueFS(this.json, 'createTime');
    this.updatedAt = getDateValueFS(this.json, 'updateTime');
  }
}

class Playlist {
  List<Track> get tracks => _tracks != null ? _tracks : [];
  List<Track> _tracks;

  int get length => _tracks != null ? _tracks.length : 0;

  String get title => _title;
  String _title;

  Playlist({List<Media> tracks, String title}) {
    this._tracks = tracks;
    this._title = title;
  }
}

DateTime getDateValueFS(Map<String, dynamic> json, String key) {
  if (!json.containsKey(key)) {
    return null;
  }

  Map<String, dynamic> _final = json;
  return _final.containsKey(key) ? DateTime.parse(_final[key] as String) : null;
}

double getDoubleValueFS(Map<String, dynamic> json, String key) {
  if (!json.containsKey('fields')) {
    return null;
  }

  Map<String, dynamic> _final = json['fields'];
  return _final.containsKey(key)
      ? double.parse(_final[key]['intValue'] as String)
      : null;
}

int getIntValueFS(Map<String, dynamic> json, String key) {
  if (!json.containsKey('fields')) {
    return null;
  }
  Map<String, dynamic> _final = json['fields'];
  return _final.containsKey(key) ? int.parse(_final[key]['intValue']) : null;
}

String getStringValueFS(Map<String, dynamic> json, String key) {
  if (!json.containsKey('fields')) {
    return json.toString();
  }
  Map<String, dynamic> _final = json['fields'];
  return _final.containsKey(key) ? _final[key]['stringValue'] : null;
}

Map<String, dynamic> getMapFS(Map<String, dynamic> json, String key) {
  if (!json.containsKey('fields')) {
    return json;
  }

  Map<String, dynamic> _final = json['fields'];
  return _final.containsKey(key) ? _final[key]['mapValue'] : _final;
}
