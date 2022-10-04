import 'package:flutter/material.dart';

class NetErrorPanel extends StatelessWidget {
  const NetErrorPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Text('状态获取异常'),
        ),
      ],
    );
  }
}
