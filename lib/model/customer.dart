class Customer {
  String _id;
  String _name;
  String _phone;
  String _email;
  String _birthay;
  String _activity; // last day buy product
  double _totalMoney;

  Customer.name(this._id, this._name, this._phone, this._email, this._birthay,
      this._activity, this._totalMoney);

  double get totalMoney => _totalMoney;

  set totalMoney(double value) {
    _totalMoney = value;
  }

  String get activity => _activity;

  set activity(String value) {
    _activity = value;
  }

  String get birthay => _birthay;

  set birthay(String value) {
    _birthay = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }


}