class DateTimeFormat {
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm:ss';
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm:ss';
  static const String dateTimeWithPipeFormat = 'HH:mm | dd/MM/yyyy';
  static const String dateTimeWithPipeDateFirstFormat = 'dd/MM/yyyy | HH:mm:ss';
  static const String dateTimeWithDashFormat = 'dd-MM-yyyy HH:mm:ss';
  static const String dateWithDashFormat = 'dd-MM-yyyy';
  static const String timeWithDashFormat = 'HH:mm:ss';
  static const String dateTimeWithDashFormatNoSeconds = 'dd-MM-yyyy HH:mm';
  static const String dateTimeForAPI = 'yyyyMMddHHmmss';
  static const String timeFormatNoSeconds = 'HH:mm';
  static const List<String> dateTimeFormats = [
    dateTimeWithPipeFormat,
    dateFormat,
    dateTimeWithPipeDateFirstFormat,
    dateTimeWithDashFormat,
    dateWithDashFormat,
    timeWithDashFormat,
    dateTimeWithDashFormatNoSeconds,
    dateTimeForAPI,
    timeFormatNoSeconds,
  ];
}
