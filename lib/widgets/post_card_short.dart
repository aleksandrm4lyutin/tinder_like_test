
import 'dart:ui';
import 'package:flutter/material.dart';
import '../abstracts/class_post.dart';


class PostCardShort extends StatefulWidget {

  final Post post;
  final Function() callback;

  const PostCardShort({super.key,
    required this.post,
    required this.callback,
  });

  @override
  State<PostCardShort> createState() => _PostCardShortState();
}

class _PostCardShortState extends State<PostCardShort> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: widget.callback,
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
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        widget.post.slug,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.post.thumbnail),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              widget.post.title,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
