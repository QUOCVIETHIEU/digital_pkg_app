import '../../../data/support/models/support_info_res.dart';

abstract class SupportRepository {
  Future<SupportInfoRes> getSupportInfo();
}
