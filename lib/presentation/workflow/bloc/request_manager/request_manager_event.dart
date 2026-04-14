part of 'request_manager_bloc.dart';

sealed class RequestManagerEvent extends Equatable {
  const RequestManagerEvent();

  @override
  List<Object> get props => [];
}

class RequestManagerLoadRequested extends RequestManagerEvent {
  const RequestManagerLoadRequested();
  @override
  List<Object> get props => [];
}
