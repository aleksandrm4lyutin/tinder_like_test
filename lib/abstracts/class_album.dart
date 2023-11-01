
import 'class_photo.dart';

class Album {

  final int id;
  final int userId;
  final String title;
  final List<Photo> photos;

  const Album({
    required this.id,
    required this.userId,
    required this.title,
    required this.photos,
  });

}