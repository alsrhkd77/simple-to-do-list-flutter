import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:simple_to_do_list/models/to_do.dart';

class HomeController extends GetxController {
  RxList<ToDo> toDoList = RxList.empty();

  Future<bool> getToDoList() async {
    List<ToDo> _list = [];
    final url = Uri.parse("http://localhost:8080/todo/get-all-todo");
    var response = await http.get(url);
    print(response.headers);
    List dataList = jsonDecode(response.body);
    _list = dataList.map<ToDo>((e) => ToDo().fromData(e)).toList();
    //_list = _randomData();
    toDoList = _list.obs;
    toDoList.refresh();
    return true;
  }

  //더미데이터
  List<ToDo> _randomData() {
    List<ToDo> _list = [];
    for (int i = 0; i < 100; i++) {
      DateTime date = DateTime.now().add(Duration(
          days: Random().nextInt(8),
          hours: Random().nextInt(24),
          minutes: Random().nextInt(60)));
      ToDo _todo = ToDo.init(i + 1, '할일${i + 1}', 'detail${i + 1}', date, Random().nextBool());
      _list.add(_todo);
    }
    _list.shuffle();
    return _list;
  }

  void setCompletion(int index, bool value){
    toDoList[index].completion = value;
    toDoList.refresh();
    final url = Uri.parse("http://localhost:8080/todo/set-completion");
    http.post(url, body: {
      "toDoId": toDoList[index].id.toString(),
      "completion": toDoList[index].completion.toString(),
    },
    );
  }
}
