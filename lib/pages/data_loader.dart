import 'package:flutter/material.dart';
import 'package:test_tinder_like_app/pages/error_page.dart';
import 'package:test_tinder_like_app/pages/home_page.dart';
import 'package:test_tinder_like_app/pages/loading_page.dart';
import '../abstracts/class_user.dart';
import '../functions/data_service.dart';


class DataLoader extends StatefulWidget {
  const DataLoader({super.key});

  @override
  State<DataLoader> createState() => _DataLoaderState();
}

class _DataLoaderState extends State<DataLoader> {

  DataService dataService = DataService();
  late Future<List<User>> future;

  @override
  void initState() {
    super.initState();

    future = dataService.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data != null) {
            return HomePage(
              users: snapshot.data!,
              size: MediaQuery.of(context).size,
            );
          } else {
            return ErrorPage(
              callback: () {
                setState(() {
                  future = dataService.loadData();
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
