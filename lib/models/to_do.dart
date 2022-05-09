class ToDo {
  String? id; //키
  String title; //제목
  String detail; //상세
  DateTime deadline; //마감일
  bool completion = false;

  ToDo(this.id, this.title, this.detail, this.deadline, this.completion); //완료 여부
}
