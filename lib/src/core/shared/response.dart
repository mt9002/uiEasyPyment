class Response<T> {
  final String message;
  final int status;
  final bool success;
  final T? data;

  Response({
    required this.message,
    required this.status,
    required this.success,
    this.data,
  });
  factory Response.success({
    required String message,
    required int status,
    required T data,
  }) {
    return Response(
      message: message,
      status: status,
      success: true,
      data: data,
    );
  }

  factory Response.error({
    required String message,
    required int status,
  }) {
    return Response(
      message: message,
      status: status,
      success: false,
      data: null,
    );
  }
  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
      success: json['success'] ?? false,
      data: json['data'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'status': status,
      'success': success,
      'data': data,
    };
  }

  @override
  String toString() {
    return 'Response{message: $message, status: $status, success: $success, data: $data}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Response<T> &&
        other.message == message &&
        other.status == status &&
        other.success == success &&
        other.data == data;
  }
}
