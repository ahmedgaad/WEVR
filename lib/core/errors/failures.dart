import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
      final String message;

  const Failure(this.message);

}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);

  
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);


  @override
  List<Object?> get props => [message];
}

