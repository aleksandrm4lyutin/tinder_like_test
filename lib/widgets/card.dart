import 'package:flutter/material.dart';
import '../abstracts/class_user.dart';


class CarouselCard extends StatefulWidget {

  final User user;
  final double width;
  final int index;
  final Function(int) openPictures;

  const CarouselCard({super.key,
    required this.user,
    required this.width,
    required this.index,
    required this.openPictures,
  });

  @override
  State<CarouselCard> createState() => _CarouselCardState();
}

class _CarouselCardState extends State<CarouselCard> {

  late List<String> info;

  @override
  void initState() {
    super.initState();

    info = genInfoList(widget.user);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                widget.openPictures(widget.index);
              },
              child: Stack(
                children: [
                  SizedBox(
                    width: widget.width,
                    height: widget.width,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  Center(
                    child: Image(
                      //fit: BoxFit.contain,
                      image: NetworkImage(widget.user.albums[0].photos[0].url),
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.user.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.user.companyName,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 20,),

            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(info.length, (ii) {
                  return Text(
                    info[ii],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 20),
                  );
                }),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

List<String> genInfoList(User user) {
  return [
    user.userName,
    user.email,
    user.suite,
    user.city,
    user.zipcode,
    '${user.geoLat}, ${user.geoLng}',
    user.phone,
    user.website,
    user.companyCatchPhrase,
    user.companyBs,
  ];
}