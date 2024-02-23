import 'package:flutter/material.dart';
import 'styles.dart';
import 'database_helper.dart'; // database_helper.dartをインポート

class InsertTaskScreen extends StatefulWidget {
  @override
  _InsertTaskScreenState createState() => _InsertTaskScreenState();
}

class _InsertTaskScreenState extends State<InsertTaskScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  // DatabaseHelperのインスタンスを作成
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Task'), // タイトルを設定
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // もんだいフォーム
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: questionController,
                decoration: InputDecoration(
                  labelText: 'もんだい：',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // こたえフォーム
            Padding(
              padding: EdgeInsets.all(16),
              child: TextFormField(
                controller: answerController,
                decoration: InputDecoration(
                  labelText: 'こたえ：',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // とうろくボタン
            ElevatedButton(
              onPressed: () {
                // とうろく ボタンが押された時の処理
                String question = questionController.text;
                String answer = answerController.text;

                // データをSQLiteに挿入
                dbHelper.insertTask(question, answer);

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('とうろくしました'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('もんだい： $question'),
                          Text('こたえ： $answer'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            questionController.clear();
                            answerController.clear();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'とうろく',
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
