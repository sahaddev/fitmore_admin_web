import 'package:equatable/equatable.dart';

class SignUpEntity extends Equatable {
  final bool status;
  final String message;

  const SignUpEntity({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
