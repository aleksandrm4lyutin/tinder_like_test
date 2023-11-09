import 'package:flutter/material.dart';
import 'package:test_tinder_like_app/pages/error_page.dart';
import 'package:test_tinder_like_app/pages/home_page.dart';
import 'package:test_tinder_like_app/pages/loading_page.dart';
import '../abstracts/class_post.dart';
import '../functions/data_service.dart';


class DataLoader extends StatefulWidget {
  const DataLoader({super.key});

  @override
  State<DataLoader> createState() => _DataLoaderState();
}

class _DataLoaderState extends State<DataLoader> {

  DataService dataService = DataService();
  late Future<List<Post>?> future;

  @override
  void initState() {
    super.initState();

    future = dataService.getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            return HomePage(
              callback: () {
                setState(() {
                  future = dataService.getAllPosts();
                });
              },
              posts: snapshot.data!,
            );
          } else {
            return ErrorPage(
              callback: () {
                setState(() {
                  future = dataService.getAllPosts();
                });
              },
              error: '${snapshot.error}',
            );
          }
        }
        return const LoadingPage();
      },
    );
  }
}
