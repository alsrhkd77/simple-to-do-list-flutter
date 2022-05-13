import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoDetailViewPage extends StatefulWidget {
  const ToDoDetailViewPage({Key? key}) : super(key: key);

  @override
  State<ToDoDetailViewPage> createState() => _ToDoDetailViewPageState();
}

class _ToDoDetailViewPageState extends State<ToDoDetailViewPage> {
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
