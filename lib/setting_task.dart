import 'package:flutter/material.dart';

class SettingTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Task'), // タイトルを設定
      ),
      body: Center(
        child: Text('Setting Task Screen'), // 仮のウィジェットを表示
      ),
    );
  }
}
