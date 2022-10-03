import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GithubRepositoryLoadingPanel extends StatelessWidget {
  const GithubRepositoryLoadingPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: SpinKitFadingCube(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Text("数据加载中...",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),)
        ],
      ),
    );
  }
}
