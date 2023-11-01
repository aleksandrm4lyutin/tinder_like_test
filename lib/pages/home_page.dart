import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_tinder_like_app/widgets/card.dart';
import 'package:test_tinder_like_app/widgets/dialog.dart';
import '../abstracts/class_user.dart';

class HomePage extends StatefulWidget {

  final Size size;
  final List<User> users;

  const HomePage({super.key,
    required this.users,
    required this.size,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late List<User> users;
  late final CarouselController controller = CarouselController();
  int currentTab = 0;

  @override
  void initState() {
    super.initState();

    users = widget.users;
  }


  void forward() {
    controller.nextPage();
  }

  void back() {
    controller.previousPage();
  }

  void open(User user) {
    showDialog(
      context: context,
      builder: (BuildContext context) => PhotoDialog(user: user),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// CARDS
          CarouselSlider(
            disableGesture: true,
            carouselController: controller,
              items: List.generate(users.length, (i) {
                return CarouselCard(
                  openPictures: (index) {
                    open(users[index]);
                  },
                  index: i,
                  user: users[i],
                  width: widget.size.width - 40,
                );
              }),
              options: CarouselOptions(
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: widget.size.height - 100,
                viewportFraction: 1,
              )
          ),
          /// BOTTOM CONTROL
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: back,
                icon: const Icon(Icons.arrow_back_ios_new, size: 40,),
              ),
              IconButton(
                onPressed: forward,
                icon: const Icon(Icons.arrow_forward_ios, size: 40,),
              ),
            ],
          )

        ],
      ),
    );
  }
}