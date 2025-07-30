enum ResultState { success, error, noData }

enum OperationStatus { loading, sending, stopped }

class Response<T> {
  final String _message;
  ResultState _resulState = ResultState.noData;
  OperationStatus _operationStatus = OperationStatus.stopped;
  final T? _data;

  Response(this._message, this._resulState, [this._data]);

  static Response<T> success<T>(String message, [T? data]) {
    return Response<T>(message, ResultState.success, data);
  }

  static Response<T> error<T>(String message) {
    return Response<T>(message, ResultState.error, null);
  }

  static Response<T> noData<T>() {
    return Response<T>('no data', ResultState.noData, null);
  }

  String get message => _message;
  ResultState get getResultState => _resulState;
  T? get data => _data;

  void setResultState(ResultState state) {
    _resulState = state;
  }

  void setOperationStatus(OperationStatus status) {
    _operationStatus = status;
  }

  get isSuccess => _resulState == ResultState.success;
  get isError => _resulState == ResultState.error;
  get isLoading => _operationStatus == OperationStatus.loading;
  get isSending => _operationStatus == OperationStatus.sending;
  get isStopped => _operationStatus == OperationStatus.stopped;
}
