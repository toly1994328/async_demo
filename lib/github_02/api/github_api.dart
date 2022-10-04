import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/github_repository.dart';
import '../views/github_repository_error_panel.dart';
import 'state.dart';

class GithubApi {
  static const String host = 'https://api.github.com';

  late Dio dio;

  GithubApi() {
    dio = Dio(BaseOptions(baseUrl: host));
  }

  final StreamController<RepositoryState> _reposCtrl = StreamController();

  Stream<RepositoryState> get repositoryStream => _reposCtrl.stream;

  int _time = 0;

  void getRepositoryByUser({required String username}) async {
    _time = DateTime.now().millisecondsSinceEpoch;
    String url = '/users/$username/repos';
    List<GithubRepository> resultReps = [];
    _reposCtrl.add(const RepositoryLoadingState()); // 产出等待中状态
    try {
      Response<String> rep = await dio.get<String>(url);
      rep = await dio.get<String>(url);
      if (rep.statusCode == 200 && rep.data != null) {
        dynamic result = json.decode(rep.data!);
        resultReps =
            result.map<GithubRepository>(GithubRepository.fromJson).toList();
        _reposCtrl.add(RepositoryLoadedState(data: resultReps)); // 产出加载完成状态
      } else {
        _reposCtrl.add(const RepositoryErrorState(
            type: ErrorType.serverError)); // 产出加载异常状态
      }
    } catch (e) {
      ErrorType type = ErrorType.netConnectError;
      if (e is DioError) {
        if (e.type == DioErrorType.other) {
          type = ErrorType.netConnectError;
        } else {
          type = ErrorType.serverError;
        }
      } else {
        type = ErrorType.dataParserError;
      }
      int now = DateTime.now().millisecondsSinceEpoch;
      int cost = now - _time;
      if (now - _time < 1000) {
        await Future.delayed(Duration(milliseconds: 1000 - cost));
      }
      _reposCtrl.add(RepositoryErrorState(type: type)); // 产出加载异常状态
    }
  }
}
