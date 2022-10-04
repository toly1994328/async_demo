import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api/github_api.dart';
import 'api/state.dart';
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

  StreamController<List<GithubRepository>> _ctrl = StreamController();

  @override
  void initState() {
    super.initState();
    api.getRepositoryByUser(username: 'toly1994328');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('toly1994328 的 github 仓库'),
      ),
      body: StreamBuilder<RepositoryState>(
        stream: api.repositoryStream,
        builder: buildByState,
      ),
    );
  }

  void refresh() {
    api.getRepositoryByUser(username: 'toly1994328');
  }

  Widget buildByState(BuildContext context, AsyncSnapshot<RepositoryState> snapshot) {
    if (snapshot.hasData && snapshot.data != null) {
      RepositoryState state = snapshot.data!;
      if (state is RepositoryLoadingState) {
        return const GithubRepositoryLoadingPanel();
      }
      if (state is RepositoryLoadedState) {
        return GithubRepositoryPanel(githubRepositories: state.data);
      }

      if (state is RepositoryErrorState) {
        return GithubRepositoryErrorPanel(
          errorType: state.type,
          onRefresh: refresh,
        );
      }
    }
    return const SizedBox.shrink();
  }
}
