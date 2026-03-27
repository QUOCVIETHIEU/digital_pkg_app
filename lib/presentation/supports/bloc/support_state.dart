part of 'support_bloc.dart';

final class SupportState extends Equatable {
  final SupportInformation? supportInformation;
  final VendorInformation? vendorInformation;
  final Status status;
  final AppException? error;

  const SupportState({
    this.supportInformation,
    this.vendorInformation,
    this.status = Status.loading,
    this.error,
  });

  SupportState copyWith({
    SupportInformation? supportInformation,
    VendorInformation? vendorInformation,
    Status? status,
    AppException? error,
  }) {
    return SupportState(
      supportInformation: supportInformation ?? this.supportInformation,
      vendorInformation: vendorInformation ?? this.vendorInformation,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    supportInformation,
    vendorInformation,
    status,
    error,
  ];
}
