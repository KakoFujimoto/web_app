import 'package:flutter/material.dart';
import 'styles.dart';
import 'insert_task.dart'
    as InsertTask; // insert_task.dart を InsertTask という名前でインポート
import 'setting_task.dart'
    as SettingTask; // setting_task.dart を SettingTask という名前でインポート

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '自分専用問題集',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // もんだい ボタンが押された時の処理
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'もんだい',
                  style: CustomTextStyles.buttonTextStyle,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // とうろく ボタンが押された時の処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InsertTask
                        .InsertTaskScreen(), // InsertTaskScreen を InsertTask.InsertTaskScreen として参照
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'とうろく',
                  style: CustomTextStyles.buttonTextStyle,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // せってい ボタンが押された時の処理
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingTask
                        .SettingTaskScreen(), // SettingTaskScreen を SettingTask.SettingTaskScreen として参照
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'せってい',
                  style: CustomTextStyles.buttonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
