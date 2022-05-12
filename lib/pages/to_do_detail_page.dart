import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({Key? key}) : super(key: key);

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  @override
  void initState() {
    if(Get.parameters.containsKey('key')){
      String _key = Get.parameters['key']!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple to do list'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            child: Column(
              children: [],
            ),
          ),
        ),
      ),
    );
  }
}
