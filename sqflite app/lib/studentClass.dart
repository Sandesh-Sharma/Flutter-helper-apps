class Student {
  int id;
  String name;
  String address;
  String course;
  String score;
  Student({@required this.name, @required this.course, this.id,@required this.address,@required this.score});
  Map<String, dynamic> toMap() {
    return {'name': name, 'course': course,'address':address,'score':score};
  }
}
