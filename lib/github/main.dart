import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'github_api.dart';
import 'model/github_repository.dart';
import 'views/github_repository_error_panel.dart';
import 'views/github_repository_loading_panel.dart';
import 'views/github_repository_panel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<GithubRepository>> task;

  final GithubApi api = GithubApi();

  @override
  void initState() {
    super.initState();
    task = api.getRepositoryByUser(username: 'toly1994328');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){},
      ),
      appBar: AppBar(
        title: Text('toly1994328 的 github 仓库'),
      ),
      body: FutureBuilder<List<GithubRepository>>(
        future: task,
        builder: buildByState,
      ),
    );
  }

  void refresh(){
    task = api.getRepositoryByUser(username: 'toly1994328');
    setState(() {

    });
  }

  Widget buildByState(BuildContext context, AsyncSnapshot<List<GithubRepository>> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.active:
        break;
      case ConnectionState.waiting:
        return const GithubRepositoryLoadingPanel();
      case ConnectionState.done:
        if (snapshot.hasError) {
          return GithubRepositoryErrorPanel(
            onRefresh: refresh,
            errorType:snapshot.error as ErrorType
          );
        }
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return  GithubRepositoryPanel(githubRepositories: snapshot.data!);
          }
        }
        break;
    }
    return const SizedBox.shrink();
  }




}
