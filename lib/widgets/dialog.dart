import 'package:flutter/material.dart';
import '../abstracts/class_user.dart';


class PhotoDialog extends StatefulWidget {

  final User user;

  const PhotoDialog({super.key,
    required this.user,
  });

  @override
  State<PhotoDialog> createState() => _PhotoDialogState();
}

class _PhotoDialogState extends State<PhotoDialog> {

  late List<String> photos;

  @override
  void initState() {
    super.initState();

    prepPhotos();
  }

  void prepPhotos() {
    photos = [];
    for(var album in widget.user.albums) {
      for(var photo in album.photos) {
        photos.add(photo.url);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          /// Photos
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: photos.length,
            itemBuilder: (context, i) {
              return Stack(
                children: [
                  const SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  Image(
                    image: NetworkImage(photos[i]),
                  ),
                ],
              );
            }
          ),
          /// Close Button
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close, size: 40,),
          ),
        ],
      ),
    );
    return SimpleDialog(
      insetPadding: const EdgeInsets.all(20),
      title: Row(
        children: [

        ],
      ),
      children: List.generate(photos.length, (i) {
        return Stack(
          children: [
            SizedBox(

              child: const Center(child: CircularProgressIndicator()),
            ),
            Image(
              image: NetworkImage(photos[i]),
            ),
          ],
        );
      }),
    );
  }
}
