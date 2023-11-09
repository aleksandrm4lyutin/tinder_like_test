
import 'dart:ui';
import 'package:flutter/material.dart';
import '../abstracts/class_post.dart';


class PostCardFull extends StatelessWidget {

  final Post post;

  const PostCardFull({super.key,
    required this.post,
  });


  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width - 20;

    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2, color: Colors.white70),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white54, Colors.white24]
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        SizedBox(
                          width: w,
                          height: w * 0.5,
                          child: const Center(
                            child: CircularProgressIndicator(color: Colors.white54,),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            width: w,
                            height: w * 0.5,
                            fit: BoxFit.fitWidth,
                            image: NetworkImage(post.image),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Text(
                    post.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Text(
                    post.content,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          post.category,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          post.publishedAt,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}

