class Student {
  int id;
  String name;
  String course;
  Student({@required this.name, @required this.course, this.id});
  Map<String, dynamic> toMap() {
    return {'name': name, 'course': course};
  }
}
