class ApiResponse<T> {
  final int status;
  final T? data;

  ApiResponse({required this.status, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse<T>(
      status: json['status'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T?) toJsonT) {
    return {
      'status': status,
      'data': data != null ? toJsonT(data) : null,
    };
  }
}
