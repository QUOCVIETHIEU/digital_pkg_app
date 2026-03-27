import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../common/models/network.dart';
import '../../../core/constants/enums.dart';
import '../../../data/support/models/models.dart';
import '../../../domain/support/repositories/support.dart';
import '../../../service_locator.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(const SupportState()) {
    on<SupportLoadRequested>(_onLoadRequested);
    on<SupportRefreshRequested>(_onRefreshRequested);
  }

  FutureOr<void> _onLoadRequested(
    SupportLoadRequested event,
    Emitter<SupportState> emit,
  ) async {
    await _loadSupportInfo(emit);
  }

  FutureOr<void> _onRefreshRequested(
    SupportRefreshRequested event,
    Emitter<SupportState> emit,
  ) async {
    await _loadSupportInfo(emit);
  }

  Future<void> _loadSupportInfo(Emitter<SupportState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final supportInfoRes = await sl<SupportRepository>().getSupportInfo();

      emit(
        state.copyWith(
          status: Status.loaded,
          supportInformation: supportInfoRes.supportInformation,
          vendorInformation: supportInfoRes.vendorInformation,
          error: null,
        ),
      );
    } on AppException catch (e) {
      emit(state.copyWith(status: Status.error, error: e));
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.error,
          error: AppException.fromMessage('An unexpected error occurred'),
        ),
      );
    }
  }
}
