part of 'support_bloc.dart';

sealed class SupportEvent extends Equatable {
  const SupportEvent();

  @override
  List<Object> get props => [];
}

final class SupportLoadRequested extends SupportEvent {
  const SupportLoadRequested();
}

final class SupportRefreshRequested extends SupportEvent {
  const SupportRefreshRequested();
}
