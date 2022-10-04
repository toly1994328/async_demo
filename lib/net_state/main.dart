// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Flutter code sample for [StreamBuilder].

import 'dart:async';

import 'package:async_demo/net_state/view/net_state_panel.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view/net_error_panel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  late Stream<ConnectivityResult> netStream;

  @override
  void initState() {
    super.initState();
    netStream = Connectivity().onConnectivityChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('网络状态监听'),),
      body: Center(
        child: StreamBuilder<ConnectivityResult>(
          stream: netStream,
          builder: _buildByStreamState,
        ),
      ),
    );
  }

  Widget _buildByStreamState(
      BuildContext context, AsyncSnapshot<ConnectivityResult> snapshot) {
    if (snapshot.hasError) {
      return const NetErrorPanel();
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.done:
        break;
      case ConnectionState.waiting:
        return const CupertinoActivityIndicator();
      case ConnectionState.active:
        return NetStatePanel(state: snapshot.data);
    }
    return const SizedBox.shrink();
  }
}
