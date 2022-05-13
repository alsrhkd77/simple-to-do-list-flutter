import 'package:get/get.dart';
import 'package:simple_to_do_list/models/to_do.dart';

class ToDoDetailViewController extends GetxController {
  late Rx<ToDo> detail;

  void getDetail(){
    ToDo _todo;
    _todo = makeData();
    detail = _todo.obs;
    detail.refresh();
  }

  //더미데이터 생성
  ToDo makeData(){
    return ToDo('id', 'title','detail', DateTime.now(), false);
  }
}
