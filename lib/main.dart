import 'package:flutter/material.dart';
import 'styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自分専用問題集',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // もんだい ボタンが押された時の処理
                },
                child: const Padding(
                  padding: EdgeInsets.all(16), // ボタン内の余白を設定
                  child: Text('もんだい',
                      style:
                          CustomTextStyles.buttonTextStyle), // ボタンのテキストスタイルを適用
                ),
              ),
              SizedBox(height: 20), // ボタン間の垂直間隔を設定
              ElevatedButton(
                onPressed: () {
                  // とうろく ボタンが押された時の処理
                },
                child: const Padding(
                  padding: EdgeInsets.all(16), // ボタン内の余白を設定
                  child: Text('とうろく',
                      style:
                          CustomTextStyles.buttonTextStyle), // ボタンのテキストスタイルを適用
                ),
              ),
              SizedBox(height: 20), // ボタン間の垂直間隔を設定
              ElevatedButton(
                onPressed: () {
                  // せってい ボタンが押された時の処理
                },
                child: const Padding(
                  padding: EdgeInsets.all(16), // ボタン内の余白を設定
                  child: Text('せってい',
                      style:
                          CustomTextStyles.buttonTextStyle), // ボタンのテキストスタイルを適用
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
