import 'package:flutter/material.dart';
import 'package:test_tinder_like_app/widgets/post_card_full.dart';
import '../abstracts/class_post.dart';


class PostViewer extends StatelessWidget {

  final Post post;

  const PostViewer({super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

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
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          post.slug,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: h - 120,
                  child: SingleChildScrollView(
                    child: PostCardFull(post: post,),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
