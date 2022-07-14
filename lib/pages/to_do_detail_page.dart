import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_to_do_list/controllers/to_do_detail_controller.dart';
import 'package:simple_to_do_list/models/to_do.dart';

class ToDoDetailPage extends StatefulWidget {
  const ToDoDetailPage({Key? key}) : super(key: key);

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  final ToDoDetailController _controller = ToDoDetailController();

  @override
  void initState() {
    if (Get.parameters.containsKey('key')) {
      String _key = Get.parameters['key']!;
      _controller.getDetail(_key);
    }
    super.initState();
  }

  Widget buildBody() {
    if (_controller.detail.value.id == null) {
      return const CircularProgressIndicator();
    } else {
      ToDo _value = _controller.detail.value;
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  value: _value.completion,
                  onChanged: (value) {
                    _value.completion = value!;
                  }),
              Text(
                _value.title,
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Text('Simple to do list'),
          onTap: () {
            Get.toNamed('/');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1440),
            padding: EdgeInsets.all(12.0),
            child: Obx(buildBody),
          ),
        ),
      ),
    );
  }
}
