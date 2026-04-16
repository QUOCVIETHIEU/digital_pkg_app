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
          requestApprovePeople: 'Nguyễn Văn B',
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
          requestApprovePeople: 'Nguyễn Văn B',
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
        WorkflowTimelineItem(
          stepName: 'EXECUTIONS',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'NPD + PLANT',
          titleRequest: 'GỬI THÔNG BÁO, CHUẨN BỊ KẾ HOẠCH TESTING, CHẠY TRIAL',
          requestDescription:
              'PCU/NPD điền đầy đủ thông tin của itemcode để gửi yêu cầu',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'NPD, Plant',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'Chuẩn bị nguyên liệu test',
              stepDescription: 'Đã chuẩn bị thành công nguyên liệu test',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.itemExecutions,
              itemInformation: ItemInformation(
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                itemCode: '200000001',
                itemName: 'CROWNClosure_CF_2.45_White_F-H-C-B-J_SVN',
                note: 'Test line Q',
                batchItems: [
                  BatchItem(
                    batchLot: '110125-SVN',
                    quantity: 10.0,
                    note: 'Nguyên liệu test 1',
                  ),
                  BatchItem(
                    batchLot: '300825-SVN',
                    quantity: 20.0,
                    note: 'Nguyên liệu test 2',
                  ),
                  BatchItem(
                    batchLot: '240426-SVN',
                    quantity: 30.0,
                    note: 'Nguyên liệu test 3',
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'Gửi Email thông báo chạy test NVL tới nhà máy',
              stepDescription: 'Đã gửi thông báo thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.planExecution,
              materialNotification: MaterialNotification(
                peopleDownload: 'Nguyễn Văn A',
                datetimeCreate: DateTime.now(),
                sendToPeople: 'plant.manager@email.com',
                subject: 'Thông báo chạy trials nguyên vật liệu testing',
                itemCode: '200000001',
                quantity: 10.0,
                lineName: 'SVN',
                unit: 'Cav.',
                datetimeConfirm: DateTime.now(),
                dateTimeSend: DateTime.now(),
              ),
            ),

            WorkflowStep(
              stepName: 'Nhà máy xác nhận kế hoạch và chuẩn bị NVL test',
              stepDescription: 'Đã xác nhận thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.confirmExecution,
              viewComment: 'Nhà máy đã xác nhận kế hoạch',
            ),
          ],
        ),
        WorkflowTimelineItem(
          stepName: 'RESULT',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'QC + NPD',
          titleRequest: 'QC CẬP NHẬT & REVIEW KẾT QUẢ',
          requestDescription:
              'QC gửi gửi quả test nguyên liệu và NPC review  xác nhận Short-run',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'QC, NPD',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'QC cập nhật thông tin kết quả test nguyên vật liệu',
              stepDescription: 'Đã gửi email thông báo kết quả',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.qcResult,
              documentMaterial: DocumentMaterial(
                documentTitle: 'Kết quả test nguyên vật liệu',
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                parameterTestings: [
                  ParameterTesting(
                    parameterName: 'Parameter Testing 01',
                    values: [100.3, 25.3, 15.6],
                  ),
                  ParameterTesting(
                    parameterName: 'Parameter Testing 02',
                    values: [120.3, 55.3, 15.6],
                  ),
                  ParameterTesting(
                    parameterName: 'Parameter Testing 03',
                    values: [120.3, 85.3, 25.6],
                  ),
                ],
                files: [
                  WorkflowFile(
                    fileName: 'Kết quả testing File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 02',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 03',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 04',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'NPD review kết quả và cập nhật thông tin Short-run',
              stepDescription: 'Kết quả test Passed',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.qcConfirm,
              viewComment: 'NPD review and updated Short run Result',
            ),
          ],
        ),
        WorkflowTimelineItem(
          stepName: 'GLOBAL APPROVE',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'NPD + QA',
          titleRequest: 'QC CẬP NHẬT KẾT QUẢ QPPROVE TỪ GLOBAL',
          requestDescription:
              'QC gửi thông tin qua global và nhận kết quả cập nhật lên hệ thống',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'QQC, NPD, Sun/Pep',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'QC Upload ICS/PS approved 01',
              stepDescription: 'Đã upload file phê duyệt thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.globalUpload,
              documentMaterial: DocumentMaterial(
                documentTitle: 'GLOBAL APPROVE RESULT',
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                globalUploadType: GlobalUploadType.globalApprove,
                files: [
                  WorkflowFile(
                    fileName: 'Kết quả testing File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 02',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 03',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 04',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'QC Upload ICS/PS approved 2',
              stepDescription: 'Đã upload file phê duyệt thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.globalUpload,
              documentMaterial: DocumentMaterial(
                documentTitle: 'GLOBAL APPROVE RESULT',
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                globalUploadType: GlobalUploadType.globalReject,
                files: [
                  WorkflowFile(
                    fileName: 'Kết quả testing File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 02',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 03',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Kết quả testing File 04',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),
            WorkflowStep(
              stepName: 'NPD review kết quả và cập nhật thông tin Short-run',
              stepDescription: 'Kết quả test Passed',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.globalResult,
              viewComment: 'Global approve testing result',
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
