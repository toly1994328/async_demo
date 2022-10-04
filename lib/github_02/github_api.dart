import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import 'model/github_repository.dart';
import 'views/github_repository_error_panel.dart';

class GithubApi {
  static const String host = 'https://api.github.com';

  late Dio dio;

  GithubApi() {
    dio = Dio(BaseOptions(baseUrl: host));
  }

  Future<List<GithubRepository>> getRepositoryByUser({
    required String username,
  }) async {
    String url = '/users/$username/repos';
    List<GithubRepository> resultReps = [];
    try{
      Response<String> rep = await dio.get<String>(url);
      rep = await dio.get<String>(url);
      print(rep);
      if (rep.statusCode == 200 && rep.data != null) {
        dynamic result = json.decode(rep.data!);
        resultReps = result.map<GithubRepository>(GithubRepository.fromJson).toList();
      }else{
        throw ErrorType.serverError;
      }
    }catch(e){
      print(e);

      if(e is DioError){
        if(e.type==DioErrorType.other){
          throw ErrorType.netConnectError;
        }else{
          throw ErrorType.serverError;
        }
      }else{
        throw ErrorType.dataParserError;
      }
    }
    return resultReps;
  }

  StreamController<List<GithubRepository>> _reposCtrl = StreamController();


}

class RepositoryState{

}

class RepositoryLoadedState{
  final List<GithubRepository> data;

  RepositoryLoadedState({required this.data});
}