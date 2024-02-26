import 'package:flutter/material.dart';
import 'styles.dart';
import 'database_helper.dart'; // database_helper.dartをインポート

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

class InsertTaskScreen extends StatefulWidget {
  @override
  _InsertTaskScreenState createState() => _InsertTaskScreenState();
}

class _InsertTaskScreenState extends State<InsertTaskScreen> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerController = TextEditingController();

  // DatabaseHelperのインスタンスを作成
  final dbHelper = DatabaseHelper();

  Future<List<Map<String, dynamic>>> _getTasks() async {
    // データベースからすべてのタスクを取得
    return dbHelper.getTasks();
  }

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
            SizedBox(height: 20),
            // タスクの一覧を表示する
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _getTasks(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final tasks = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final task = tasks[index];
                        return ListTile(
                          title: Text(task['question']),
                          subtitle: Text(task['answer']),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
