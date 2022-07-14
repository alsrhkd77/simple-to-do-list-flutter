class ToDo {
  int? id; //키
  String title; //제목
  String detail; //상세
  DateTime? deadline; //마감일
  bool completion = false;


  ToDo({this.id, this.title = '', this.detail = '', this.deadline});

  ToDo.init(this.id, this.title, this.detail, this.deadline, this.completion); //완료 여부

  ToDo fromData(Map data){
    id = data["toDoId"];
    title = data["title"];
    detail = data["detail"];
    if(data["deadline"] != null){
      deadline = DateTime.parse(data["deadline"]);
    }
    completion = data["completion"];
    return this;
  }
}
