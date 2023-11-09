import 'package:flutter/material.dart';
import 'package:test_tinder_like_app/pages/post_viewer.dart';
import '../abstracts/class_post.dart';
import '../widgets/post_card_short.dart';


class HomePage extends StatefulWidget {

  final List<Post> posts;
  final Function() callback;

  const HomePage({super.key,
    required this.posts,
    required this.callback,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late List<Post> posts;

  void openPost(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostViewer(
        post: post,
      )),
    );
  }

  Future<void> refresh() async {
    setState(() {
      widget.callback();
    });
  }

  @override
  void initState() {
    super.initState();

    posts = widget.posts;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    radius: 1.5,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black,
                    ]
                )
            ),
          ),

          SafeArea(
            child: RefreshIndicator(
              displacement: 80,
              backgroundColor: Colors.transparent,
              color: Colors.white54,
              onRefresh: refresh,
              child: ListView.builder(
                itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return PostCardShort(
                      post: posts[index],
                      callback: () {
                        openPost(posts[index]);
                      },
                    );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}