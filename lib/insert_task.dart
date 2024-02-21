import 'package:flutter/material.dart';

class InsertTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Task'), // タイトルを設定
      ),
      body: Center(
        child: Text('Insert Task Screen'), // 画面に表示するコンテンツを設定
      ),
    );
  }
}
