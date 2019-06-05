class ChapiResponse {
  bool _hasError;
  String _message;

  ChapiResponse(this._hasError, this._message);

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  bool get hasError => _hasError;

  set hasError(bool value) {
    _hasError = value;
  }

}