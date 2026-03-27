abstract class Exportable {
  List<Object> toExportData(int index);
}

abstract class ExportableWithChildren extends Exportable {
  List<Exportable> getChildren();
}

abstract class ExportableChildren extends Exportable {
  String get keyExport;
}

abstract class ExportableParent extends Exportable {
  List<Exportable> filterChildren(List<ExportableChildren> children);
  String get keyExport;
}
