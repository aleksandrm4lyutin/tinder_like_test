import 'dart:convert';
import 'package:http/http.dart' as http;
import '../abstracts/class_album.dart';
import '../abstracts/class_photo.dart';
import '../abstracts/class_user.dart';

class DataService {

  Future<List<User>> loadData() async {
    /// fetch data of all photos
    List<dynamic>? photosMap = await _getData(_photosUrl);
    if(photosMap == null) {
      throw Exception('Failed to load photos');
    }
    /// fetch data of all albums
    List<dynamic>? albumsMap = await _getData(_albumsUrl);
    if(albumsMap == null) {
      throw Exception('Failed to load albums');
    }
    /// fetch data of all users
    List<dynamic>? usersMap = await _getData(_usersUrl);
    if(usersMap == null) {
      throw Exception('Failed to load users');
    }
    /// convert and sort raw data to custom classes
    try{
      List<Photo> photos = _convertPhotos(photosMap);
      List<Album> albums = _convertAlbums(albumsMap , photos);
      List<User> users = _convertUsers(usersMap, albums);
      return users;
    } catch(e) {
      //print(e);
      throw Exception('Failed to load data');
    }
  }

  static const _photosUrl = 'https://jsonplaceholder.typicode.com/photos';
  static const _albumsUrl = 'https://jsonplaceholder.typicode.com/albums';
  static const _usersUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<dynamic>?> _getData(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body) as List<dynamic>;
      return list;
    } else {
      return null;
    }
  }

  List<Photo> _convertPhotos(List<dynamic> photosMap) {
    List<Photo> photos = [];
    for(var photo in photosMap) {
      photos.add(
        Photo(
          id: photo['id'] as int,
          albumId: photo['albumId'] as int,
          title: photo['title'] as String,
          url: photo['url'] as String,
        )
      );
    }
    return photos;
  }

  List<Album> _convertAlbums(List<dynamic> albumsMap, List<Photo> photos) {
    List<Album> albums = [];
    for(var album in albumsMap) {
      albums.add(
        Album(
          id: album['id'] as int,
          userId: album['userId'] as int,
          title: album['title'] as String,
          photos: photos.where((photo) => photo.albumId == album['id']).toList(),
        )
      );
    }
    return albums;
  }

  List<User> _convertUsers(List<dynamic> usersMap, List<Album> albums) {
    List<User> users = [];
    for(var user in usersMap) {
      users.add(
        User(
          id: user['id'] as int,
          name: user['name'] as String,
          userName: user['username'] as String,
          email: user['email'] as String,
          street: user['address']['street'] as String,
          suite: user['address']['suite'] as String,
          city: user['address']['city'] as String,
          zipcode: user['address']['zipcode'] as String,
          geoLat: user['address']['geo']['lat'] as String,
          geoLng: user['address']['geo']['lng'] as String,
          phone: user['phone'] as String,
          website: user['website'] as String,
          companyName: user['company']['name'] as String,
          companyCatchPhrase: user['company']['catchPhrase'] as String,
          companyBs: user['company']['bs'] as String,
          albums: albums.where((album) => album.userId == user['id']).toList(),
        )
      );
    }
    return users;
  }

}
