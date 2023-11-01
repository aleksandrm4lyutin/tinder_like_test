
import 'class_album.dart';

class User {

  final int id;
  final String name;
  final String userName;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final String geoLat;
  final String geoLng;
  final String phone;
  final String website;
  final String companyName;
  final String companyCatchPhrase;
  final String companyBs;
  final List<Album> albums;

  const User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geoLat,
    required this.geoLng,
    required this.phone,
    required this.website,
    required this.companyName,
    required this.companyCatchPhrase,
    required this.companyBs,
    required this.albums,
  });

}
