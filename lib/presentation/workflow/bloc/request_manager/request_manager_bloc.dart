import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/models/models.dart';
import '../../../../core/constants/constants.dart';
import '../../../../data/workflow/models/models.dart';

part 'request_manager_event.dart';
part 'request_manager_state.dart';

class RequestManagerBloc
    extends Bloc<RequestManagerEvent, RequestManagerState> {
  RequestManagerBloc() : super(RequestManagerState()) {
    on<RequestManagerLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    RequestManagerLoadRequested event,
    Emitter<RequestManagerState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      List<WorkflowTimelineItem> workflowTimelineItems;
      workflowTimelineItems = [
        WorkflowTimelineItem(
          stepName: 'REQUEST',
          stepDescription: 'PCU + NPD',
          titleRequest: 'TẠO YÊU CẦU TESTING NGUYÊN VẬT LIỆU',
          requestDescription:
              'PCU/NPD điền đầy đủ thông tin của itemcode để gửi yêu cầu',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'PCU (Normal), NPD (New line)',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'Nhập đầy đủ thông tin nguyên liệu test',
              stepDescription: 'Đã nhập thông tin nguyên liệu test thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.testRequest,
              itemTesting: ItemTesting(
                product: 'Mirinda Orange, Pepsi Regular',
                netContent: 330,
                trial: 'Carton',
                weight: 21.2,
                supplier: 'NNC Tây Ninh (Prf)',
                cav: 96,
                unit: 'Cav.',
                typeColor: 'rPET-clear',
                resinCodeSupplier: 'CB608R-Fenc TW',
                gasVolume: 'Low gas',
                closureType: 'CSD_1881',
                closureWeight: 2.15,
                closureColor: 'White',
                closureSupplier: 'Crown Seal Thai',
                closureLine: 'Sacmi',
                additive: 'No',
                note: '',
              ),
            ),
            WorkflowStep(
              stepName: 'Xác nhận/Hủy yêu cầu',
              stepDescription: 'Yêu cầu tạo nvl test thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.confirmRequest,
              viewComment: 'Nguyên Liệu sẵn sàng để chạy testing',
            ),
          ],
        ),
        WorkflowTimelineItem(
          stepName: 'REQUEST',
          stepDescription: 'PCU + NPD',
          titleRequest: 'TẠO YÊU CẦU TESTING NGUYÊN VẬT LIỆU',
          requestDescription:
              'PCU/NPD điền đầy đủ thông tin của itemcode để gửi yêu cầu',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'PCU (Normal), NPD (New line)',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'Nhập đầy đủ thông tin nguyên liệu test',
              stepDescription: 'Đã nhập thông tin nguyên liệu test thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.testRequest,
              itemTesting: ItemTesting(
                product: 'Mirinda Orange, Pepsi Regular',
                netContent: 330,
                trial: 'Carton',
                weight: 21.2,
                supplier: 'NNC Tây Ninh (Prf)',
                cav: 96,
                unit: 'Cav.',
                typeColor: 'rPET-clear',
                resinCodeSupplier: 'CB608R-Fenc TW',
                gasVolume: 'Low gas',
                closureType: 'CSD_1881',
                closureWeight: 2.15,
                closureColor: 'White',
                closureSupplier: 'Crown Seal Thai',
                closureLine: 'Sacmi',
                additive: 'No',
                note: '',
              ),
            ),
            WorkflowStep(
              stepName: 'Xác nhận/Hủy yêu cầu',
              stepDescription: 'Yêu cầu tạo nvl test thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.confirmRequest,
              viewComment: 'Nguyên Liệu sẵn sàng để chạy testing',
            ),
          ],
        ),
      ];
      emit(
        state.copyWith(
          status: Status.loaded,
          workflowTimelineItems: workflowTimelineItems,
        ),
      );
    } on AppException catch (e) {
      emit(state.copyWith(status: Status.error, error: e));
    }
  }
}
