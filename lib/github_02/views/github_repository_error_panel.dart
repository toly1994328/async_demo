import 'package:flutter/material.dart';

enum ErrorType{
  netConnectError,
  serverError,
  dataParserError
}

class GithubRepositoryErrorPanel extends StatelessWidget {
  final VoidCallback onRefresh;
  final ErrorType errorType;

  const GithubRepositoryErrorPanel({Key? key,required this.onRefresh,required this.errorType,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(errorType){
      case ErrorType.netConnectError:
        return _NetErrorPanel(onRefresh: onRefresh);
      case ErrorType.dataParserError:
        return _DataParserErrorPanel(onRefresh: onRefresh);
      case ErrorType.serverError:
        return _ServerErrorPanel(onRefresh: onRefresh);
    }
  }
}

class _NetErrorPanel extends StatelessWidget{
  final VoidCallback onRefresh;
  const _NetErrorPanel({Key? key,required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.wifi_tethering_error,size: 80,color: Colors.redAccent,),
          const SizedBox(height: 8,),
          const Text('网络不太顺畅',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          const SizedBox(height: 4,),
          const Text('请检查网络连接',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 8,),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shape: const StadiumBorder(),
              ),
              onPressed: onRefresh, child: const Text('刷新',))
        ],
      ),
    );
  }
}

class _ServerErrorPanel extends StatelessWidget{
  final VoidCallback onRefresh;
  const _ServerErrorPanel({Key? key,required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.nearby_error_outlined,size: 80,color: Colors.redAccent,),
          const SizedBox(height: 8,),
          const Text('服务器出错了',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          const SizedBox(height: 4,),
          const Text('请联系维护人员',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 8,),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shape: const StadiumBorder(),
              ),
              onPressed: onRefresh, child: const Text('刷新',))
        ],
      ),
    );
  }
}

class _DataParserErrorPanel extends StatelessWidget{
  final VoidCallback onRefresh;
  const _DataParserErrorPanel({Key? key,required this.onRefresh}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.running_with_errors_outlined,size: 80,color: Colors.redAccent,),
          const SizedBox(height: 8,),
          const Text('数据解析异常',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          const SizedBox(height: 4,),
          const Text('请联系开发人员',style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 8,),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                shape: const StadiumBorder(),
              ),
              onPressed: onRefresh, child: const Text('刷新',))
        ],
      ),
    );
  }
}