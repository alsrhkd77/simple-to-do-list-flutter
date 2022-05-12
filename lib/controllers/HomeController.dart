import 'dart:math';

import 'package:get/get.dart';
import 'package:simple_to_do_list/models/to_do.dart';

class HomeController extends GetxController {
  RxList<ToDo> toDoList = RxList.empty();

  void getToDoList() {
    List<ToDo> _list = [];
    _list = _randomData();
    toDoList = _list.obs;
    toDoList.refresh();
  }

  //더미데이터
  List<ToDo> _randomData() {
    List<ToDo> _list = [];
    for (int i = 0; i < 100; i++) {
      DateTime date = DateTime.now().add(Duration(
          days: Random().nextInt(8),
          hours: Random().nextInt(24),
          minutes: Random().nextInt(60)));
      ToDo _todo = ToDo('${i + 1}', '할일${i + 1}', 'detail${i + 1}', date, Random().nextBool());
      _list.add(_todo);
    }
    _list.shuffle();
    return _list;
  }

  void setCompletion(int index, bool value){
    toDoList[index].completion = value;
    toDoList.refresh();
  }
}
