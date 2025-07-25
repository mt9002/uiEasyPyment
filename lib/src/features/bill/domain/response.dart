

enum ResultState { loading, success, error }

class Response<T> {

  final String _message;
  ResultState _resulState;
  final T ?_data;

  Response(this._message, this._resulState, this._data);

  static Response<T> success<T>(String message, [T? data]) {
    return Response<T>( message, ResultState.success, data);
  }

  static Response<T> error<T>(String message) {
    return Response<T>(message, ResultState.error, null);
  }

  static Response<T> loading<T>([String message = 'Cargando...']) {
    return Response<T>(message, ResultState.loading, null);
  }

  String get message => _message;
  ResultState get getResultState => _resulState;
  T? get data => _data;

  setResultState(ResultState state) {
    _resulState = state;
  }
  
}
