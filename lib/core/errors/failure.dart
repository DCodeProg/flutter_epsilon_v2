import 'package:equatable/equatable.dart';

abstract interface class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);

  @override
  List<Object?> get props => [];
}
