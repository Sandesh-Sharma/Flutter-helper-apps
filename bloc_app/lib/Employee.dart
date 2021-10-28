class Employee {
  int _id;
  String _name;
  double _salary;
  String _address;

  Employee(this._id, this._name, this._salary,this._address);

  //setters

  set id(int id) {
    this._id = id;
  }

  set name(String name) {
    this._name = name;
  }

  set salary(double salary) {
    this._salary = salary;
  }
  
   set address(String address) {
    this._address = address;
  }


  //getters

  int get id => this._id;

  String get name => this._name;
  String get address => this._address;
  

  double get salary => _salary;
}
