import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String? message;
  final int? errorCode;

  const Failure(this.message, this.errorCode);

  factory Failure.fromJson(Map<String, dynamic> json) {
    return Failure(
      json['message'] as String?,
      json['errorCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'errorCode': errorCode,
    };
  }

  Failure copyWith({
    String? message,
    int? errorCode,
  }) {
    return Failure(
      message ?? this.message,
      errorCode ?? this.errorCode,
    );
  }

  @override
  List<Object?> get props => [message, errorCode];

  @override
  String toString() {
    return 'Failure( message: $message,  errorCode: $errorCode,)';
  }
}
