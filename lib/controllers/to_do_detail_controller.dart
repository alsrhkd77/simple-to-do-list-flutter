import 'dart:async';

import 'package:get/get.dart';
import 'package:simple_to_do_list/models/to_do.dart';

class ToDoDetailController extends GetxController {
  Rx<ToDo> detail = ToDo(deadline: DateTime.now()).obs;

  Future<void> getDetail(String id) async {
    ToDo _todo;
    _todo = await makeData();
    detail.value = _todo;
  }

  //더미데이터 생성
  Future<ToDo> makeData() async {
    await Future.delayed(const Duration(seconds: 3));
    return ToDo.init(null, 'title', 'detail', DateTime.now(), false);
  }
}
