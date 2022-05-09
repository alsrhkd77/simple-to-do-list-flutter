import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    _controller.getToDoList();
    super.initState();
  }

  Widget buildToDoList() {
    return ListView.builder(
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
            trailing: Text('datetime'),
            onTap: (){
              //ToDo: go detail page
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple to do list'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1440),
          child: Obx(buildToDoList),
        ),
      ),
    );
  }
}
