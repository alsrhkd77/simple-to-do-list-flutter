import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CreateToDoPage extends StatefulWidget {
  const CreateToDoPage({Key? key}) : super(key: key);

  @override
  State<CreateToDoPage> createState() => _CreateToDoPageState();
}

class _CreateToDoPageState extends State<CreateToDoPage> {
  final formStateKey = GlobalKey<FormState>();
  final TextEditingController titleEditingController = TextEditingController();
  final TextEditingController detailEditingController = TextEditingController();

  Future<void> save() async {
    Get.dialog(
      Container(
        margin: EdgeInsets.all(12.0),
        child: CircularProgressIndicator(),
      )
    );
    var url = Uri.parse("http://localhost:8080/todo/create-todo");
    Map data = {
      "title": titleEditingController.text,
      "detail": detailEditingController.text
    };
    if (formStateKey.currentState!.validate()) {
      await http.post(
        url,
        headers: {"content-type": "application/json;charset=UTF-8"},
        body: jsonEncode(data),
      );
    }
    Navigator.of(context).pop();
    Get.offAllNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("할 일 작성"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formStateKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: titleEditingController,
                  decoration: const InputDecoration(labelText: "제목"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "필수 입력";
                    }
                    return null;
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12.0),
                  child: ListTile(
                    title: Text("마감일: 2022.06.12"),
                    trailing: IconButton(
                      icon: Icon(Icons.calendar_month),
                      onPressed: (){},
                    ),
                  ),
                ),
                TextFormField(
                  controller: detailEditingController,
                  decoration: const InputDecoration(
                    labelText: "메모",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 8,
                ),
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: save,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 100.0,
                      ),
                      child: const Text("저장"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
