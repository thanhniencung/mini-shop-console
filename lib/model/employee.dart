class Employee {
  String _id;
  String _name;
  String _role;
  String _phone;
  String _email;
  String _avatar;
  String _birthday;
  String _createAt;

  Employee.name(this._id, this._name, this._role, this._phone, this._email,
      this._avatar, this._birthday, this._createAt);

  String get createAt => _createAt;

  set createAt(String value) {
    _createAt = value;
  }

  String get birthday => _birthday;

  set birthday(String value) {
    _birthday = value;
  }

  String get avatar => _avatar;

  set avatar(String value) {
    _avatar = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get role => _role;

  set role(String value) {
    _role = value;
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