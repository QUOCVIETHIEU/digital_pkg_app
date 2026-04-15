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
      await Future.delayed(const Duration(seconds: 1));
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
                peopleCreate: 'Nguyễn Văn A',
                datetimeCreate: DateTime.now(),
                product: 'Mirinda Orange, Pepsi Regular',
                netContent: 330,
                trial: ['Carton', 'Tray', 'Can', 'Box'],
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
          stepName: 'PREPARE DOC',
          stepDescription: 'NPD',
          titleRequest: 'UPLOAD TÀI LIỆU MOC, PROTOCOL, TRF CHO NVL TEST',
          requestDescription:
              'PCU/NPD điền đầy đủ thông tin của itemcode để gửi yêu cầu',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'NPD',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'Upload MOC documents',
              stepDescription: 'Upload MOC thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.updateDoc,
              documentMaterial: DocumentMaterial(
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                parameterTestings: [],
                documentTitle: 'MOC FILE UPLOADED',
                files: [
                  WorkflowFile(
                    fileName: 'Moc File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Moc File 02',
                    fileType: WorkflowFileType.image,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'Upload Protocol documents',
              stepDescription: 'Upload Protocol thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.updateDoc,
              documentMaterial: DocumentMaterial(
                documentTitle: 'PROTOCOL FILE UPLOADED',
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                parameterTestings: [],
                files: [
                  WorkflowFile(
                    fileName: 'Moc File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Moc File 02',
                    fileType: WorkflowFileType.image,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Moc File 04',
                    fileType: WorkflowFileType.xlsx,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'Upload TRF documents',
              stepDescription: 'Upload TRF thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.updateDoc,
              documentMaterial: DocumentMaterial(
                documentTitle: 'TRF FILE UPLOADED',
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                parameterTestings: [],
                files: [
                  WorkflowFile(
                    fileName: 'Moc File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Moc File 02',
                    fileType: WorkflowFileType.image,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Moc File 04',
                    fileType: WorkflowFileType.xlsx,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Moc File 05',
                    fileType: WorkflowFileType.docx,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'Xác nhận/Hủy upload',
              stepDescription: 'Đã xác nhận upload documents thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.confirmDoc,
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
