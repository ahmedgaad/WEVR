import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
      final String message;

  Failure(this.message);

}

class OfflineFailure extends Failure {
  OfflineFailure(super.message);

  
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure(super.message);


  @override
  List<Object?> get props => [message];
}

