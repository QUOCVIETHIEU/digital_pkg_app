import 'dart:math';

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
      final random = Random();
      final availablePlantStatuses = PlantStatus.values
          .where((status) => status != PlantStatus.none)
          .toList();
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
                title: 'Thông BÁO NGUYÊN VẬT LIỆU',
                peopleDownload: 'Nguyễn Văn A',
                datetimeCreate: DateTime.now(),
                sendToPeople: 'plant.manager@email.com',
                subject: 'Thông báo chạy trials nguyên vật liệu testing',
                itemCode: '200000001',
                quantity: 10.0,
                lineName: 'SVN',
                unit: 'Cav.',
                peopleHeader: 'Plant Manager',
                content:
                    'Đây là email thông báo kế hoạch testing NVL Phôi đến nhà máy DOP vào ngày 16/04/2026',
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
                documentTitle: 'GLOBAL REJECT RESULT',
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
        WorkflowTimelineItem(
          stepName: 'NW PKG APPROVE',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'NW PKG MANAGER',
          titleRequest: 'NW MANAGER REVIEW AND APPROVE',
          requestDescription:
              'NW Manager review và xác nhận kết quả để đưa vào nhà máy chạy test nguyên vật liệu',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'NW PKG Manager',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'PKG owner collect and send to NW PKG Manager',
              stepDescription: 'Đã upload file & gửi phê duyệt thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.pkgUpload,
              documentMaterial: DocumentMaterial(
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                parameterTestings: [],
                documentTitle: 'PKG UPLOAD DATA REVIEW FILE UPLOADED',
                files: [
                  WorkflowFile(
                    fileName: 'Review File 01',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Review File 02',
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                  WorkflowFile(
                    fileName: 'Review File 03',
                    fileType: WorkflowFileType.docx,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
            ),

            WorkflowStep(
              stepName: 'Kết quả phê duyệt của PKG Manager',
              stepDescription: 'PKG Manager đã phê duyệt yêu cầu',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.pkgResult,
              viewComment: 'Nguyên Liệu sẵn sàng để chạy testing',
            ),
          ],
        ),
        WorkflowTimelineItem(
          stepName: 'QCM APPROVE',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'NW PKG MANAGER',
          titleRequest: 'NW MANAGER REVIEW AND APPROVE',
          requestDescription:
              'NW Manager review và xác nhận kết quả để đưa vào nhà máy chạy test nguyên vật liệu',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'NW PKG Manager',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'QC Raw Material inform to QCM',
              stepDescription: 'Đã gửi email cho QC Manager thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.qcmInformation,
              documentMaterial: DocumentMaterial(
                peopleDownload: 'Nguyễn Văn A',
                dateTimeCreate: DateTime.now(),
                parameterTestings: [],
                documentTitle: 'QC RAW MATERIAL INFORM QCM APPROVE',
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
                    fileType: WorkflowFileType.pdf,
                    fileUrl: 'https://www.google.com',
                    uploadDatetime: DateTime.now(),
                    capacity: 113,
                  ),
                ],
              ),
              materialNotification: MaterialNotification(
                peopleDownload: 'Nguyễn Văn A',
                title: 'PKG UPLOAD DATA REVIEW FILE UPLOAD',
                datetimeCreate: DateTime.now(),
                sendToPeople: 'plant.manager@email.com',
                subject: 'Thông báo chạy trials nguyên vật liệu testing',
                itemCode: '200000001',
                quantity: 10.0,
                lineName: 'SVN',
                unit: 'Cav.',
                peopleHeader: 'QCM',
                content:
                    'Kết quả testing nguyên liệu đã thành công như file đính kèm, vui lòng kiểm tra và approve kết quả để qua bước kế tiếp',
              ),
            ),

            WorkflowStep(
              stepName: 'Kết quả phê duyệt của QC Manager',
              stepDescription: 'QC Manager phê duyệt thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.qcmResult,
              viewComment: 'Nguyên Liệu sẵn sàng để chạy testing',
            ),
          ],
        ),
        WorkflowTimelineItem(
          stepName: 'MATRIX',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'QC',
          titleRequest: 'QC CẬP NHẬT MATRIX NGUYÊN LIỆU',
          requestDescription:
              'Cập nhật Matrix nguyên vật liệu và thông báo tới PIC liên quan',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'QC Material',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'QC cập nhật Matrix nguyên liệu',
              stepDescription: ' QC đã cập nhật Matrix vào hệ thống thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.qcMatrix,
              matrixEdi: MatrixEdi(
                plantStatus: PlantStatus.hmp,
                line: 'CSD Sidel-T',
                size: 390,
                unit: 'ml',
                type: 'CSD - Clear',
                weight: 10.0,
                unitWeight: 'grs',
                supplier: 'SVN-BD',
                resin: 'Ramapet S1',
                itemCode: 'CSD-S1-390ML',
                mold: '3A-72',
                itemName: 'PET PREFORM',
                items: [
                  MatrixEdiItem(
                    materialCode: 'HCSV 2.55gr White - v6',
                    materialName: '30000077',
                  ),
                  MatrixEdiItem(
                    materialCode: 'SVN - 1.47gr Clear - D',
                    materialName: '30001560',
                  ),
                  MatrixEdiItem(
                    materialCode: 'HCVN - 2.15gr White',
                    materialName: '30003689',
                  ),
                ],
                status: [
                  TestingStatus.testing,
                  TestingStatus.testingFollow,
                  TestingStatus.testingConfirm,
                ],
              ),
              matrixEdiList: List.generate(
                20,
                (index) => MatrixEdi(
                  line: 'CSD Sidel-T ${index + 1}',
                  size: random.nextInt(100).toDouble(),
                  unit: 'ml',
                  type: 'CSD - Clear',
                  weight: random.nextInt(100).toDouble(),
                  unitWeight: 'grs',
                  supplier: 'SVN-BD ${index + 1}',
                  resin: 'Ramapet S1 ${index + 1}',
                  itemCode: 'CSD-S1-${index + 1}',
                  mold: '3A-72 ${index + 1}',
                  itemName: 'PET PREFORM ${index + 1}',
                  items: [],
                  status: List.generate(
                    8,
                    (index) =>
                        TestingStatus.values[random.nextInt(
                          TestingStatus.values.length,
                        )],
                  ),
                  plantStatus:
                      availablePlantStatuses[random.nextInt(
                        availablePlantStatuses.length,
                      )],
                ),
              ).toList(),
            ),

            WorkflowStep(
              stepName: 'Gửi thông báo tới PIC',
              stepDescription:
                  'Đã gửi email thông báo cập nhật Matrix tới các bộ phận.',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.matrixNotification,
            ),
          ],
        ),
        WorkflowTimelineItem(
          stepName: 'ITEMCODE',
          requestApprovePeople: 'Nguyễn Văn B',
          stepDescription: 'PCU + MRP + QA',
          titleRequest: 'PCU TẠO ITEMCODE MỚI TRÊN SAP',
          requestDescription:
              'Cập nhật Matrix nguyên vật liệu và thông báo tới PIC liên quan',
          requestPeople: 'Nguyễn Văn A',
          requestPic: 'CU, MRP Plant & QA Executive',
          status: WorkflowTimelineItemStatus.done,
          workflowStep: [
            WorkflowStep(
              stepName: 'QC cập nhật Matrix nguyên liệu',
              stepDescription: ' QC đã cập nhật Matrix vào hệ thống thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.itemCodeMaterial,
              matrixEdi: MatrixEdi(
                plantStatus: PlantStatus.hmp,
                line: 'CSD Sidel-T',
                size: 390,
                unit: 'ml',
                type: 'CSD - Clear',
                weight: 10.0,
                unitWeight: 'grs',
                supplier: 'SVN-BD',
                resin: 'Ramapet S1',
                itemCode: 'CSD-S1-390ML',
                mold: '3A-72',
                itemName: 'PET PREFORM',
                items: [
                  MatrixEdiItem(
                    materialCode: 'HCSV 2.55gr White - v6',
                    materialName: '30000077',
                  ),
                  MatrixEdiItem(
                    materialCode: 'SVN - 1.47gr Clear - D',
                    materialName: '30001560',
                  ),
                  MatrixEdiItem(
                    materialCode: 'HCVN - 2.15gr White',
                    materialName: '30003689',
                  ),
                ],
                status: [
                  TestingStatus.testing,
                  TestingStatus.testingFollow,
                  TestingStatus.testingConfirm,
                ],
              ),
              matrixEdiList: List.generate(
                20,
                (index) => MatrixEdi(
                  line: 'CSD Sidel-T ${index + 1}',
                  size: random.nextInt(100).toDouble(),
                  unit: 'ml',
                  type: 'CSD - Clear',
                  weight: random.nextInt(100).toDouble(),
                  unitWeight: 'grs',
                  supplier: 'SVN-BD ${index + 1}',
                  resin: 'Ramapet S1 ${index + 1}',
                  itemCode: 'CSD-S1-${index + 1}',
                  mold: '3A-72 ${index + 1}',
                  itemName: 'PET PREFORM ${index + 1}',
                  items: [],
                  status: List.generate(
                    8,
                    (index) =>
                        TestingStatus.values[random.nextInt(
                          TestingStatus.values.length,
                        )],
                  ),
                  plantStatus:
                      availablePlantStatuses[random.nextInt(
                        availablePlantStatuses.length,
                      )],
                ),
              ).toList(),
            ),
            WorkflowStep(
              stepName: 'QC cập nhật Matrix nguyên liệu',
              stepDescription: ' QC đã cập nhật Matrix vào hệ thống thành công',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.itemCodeBom,
            ),

            WorkflowStep(
              stepName: 'PCU update new item on SAP',
              stepDescription: 'Đã cập nhật thành công thông tin item trên SAP',
              stepPeople: 'Nguyễn Văn A',
              stepDatetime: DateTime.now(),
              status: WorkflowStepStatus.itemCodeConfirm,
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
