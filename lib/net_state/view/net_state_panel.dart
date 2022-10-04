import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetStatePanel extends StatelessWidget {
  final ConnectivityResult? state;

  const NetStatePanel({Key? key,required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          if(state == ConnectivityResult.mobile)
          const Icon(
            Icons.network_cell,
            color: Colors.green,
            size: 60,
          ),
        if(state == ConnectivityResult.wifi)
          const Icon(
            Icons.wifi,
            color: Colors.blue,
            size: 60,
          ),
        if(state == ConnectivityResult.none)
          const Icon(
            Icons.network_locked_outlined,
            color: Colors.grey,
            size: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('$state'),
          ),
      ],
    );
  }
}
