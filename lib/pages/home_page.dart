import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_to_do_list/common/date_time_formatter.dart';
import 'package:simple_to_do_list/controllers/HomeController.dart';
import 'package:simple_to_do_list/models/to_do.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
  }

  Widget buildToDoList() {
    return ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (BuildContext _context, int index) => const Divider(),
        itemCount: _controller.toDoList.length,
        itemBuilder: (BuildContext _context, int index) {
          ToDo _value = _controller.toDoList[index];
          return ListTile(
            leading: Checkbox(
              value: _value.completion,
              onChanged: (value) {
                _controller.setCompletion(index, value!);
              },
            ),
            title: Text(_value.title),
            subtitle: Text(_value.detail),
            trailing: _value.deadline == null
                ? null
                : Text(DateTimeFormatter.dateTimeToString(_value.deadline!)),
            onTap: () {
              Get.toNamed('/detail', parameters: {'key': _value.id.toString()});
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple to do list'),
      ),
      body: FutureBuilder(
        future: _controller.getToDoList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: Obx(buildToDoList),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () {
          Get.toNamed('/new-todo');
        },
      ),
    );
  }
}
