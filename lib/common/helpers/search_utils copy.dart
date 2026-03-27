class SearchUtils {
  static List<T> filterListBySearch<T>({
    required List<T> items,
    required String search,
    required List<String> Function(T) getSearchableFields,
  }) {
    if (search.trim().isEmpty) return items;

    final searchTerms = search
        .replaceAll(RegExp(r'\s+'), '')
        .split(',')
        .map((s) => s.trim().toLowerCase())
        .where((s) => s.isNotEmpty)
        .toList();

    return items.where((item) {
      final fields = getSearchableFields(item)
          .map(
            (field) =>
                field.replaceAll(RegExp(r'\s+'), '').trim().toLowerCase(),
          )
          .toList();

      return searchTerms.every(
        (term) => fields.any((field) => field.contains(term)),
      );
    }).toList();
  }

  static List<T> filterListBySearchAndStatus<T, E extends Enum>({
    required List<T> items,
    required String search,
    required List<String> Function(T) getSearchableFields,
    required E statusFilter,
    required E noneValue,
    required E Function(T) getStatus,
  }) {
    // First, filter by search
    List<T> filtered = filterListBySearch(
      items: items,
      search: search,
      getSearchableFields: getSearchableFields,
    );
    // Then, filter by optional status
    if (statusFilter != noneValue) {
      filtered = filtered
          .where((item) => getStatus(item) == statusFilter)
          .toList();
    }
    return filtered;
  }

  static List<T> filterByOptionalStatus<T>(
    List<T> items, {
    dynamic statusFilter,
    dynamic Function(T)? getStatus,
    dynamic noneValue,
  }) {
    if (statusFilter == null || statusFilter == noneValue) {
      return items;
    }
    return items.where((item) => getStatus!(item) == statusFilter).toList();
  }

  static (List<T>, int, int, int, int) filterListBySearchAndPage<T>({
    required List<T> items,
    required String search,
    required List<String> Function(T) getSearchableFields,
    required int currentPage,
    required int rowsPerPage,
  }) {
    final searchTerms = search
        .replaceAll(RegExp(r'\s+'), '')
        .split(',')
        .map((s) => s.trim().toLowerCase())
        .where((s) => s.isNotEmpty)
        .toList();

    final filtered = items.where((item) {
      final fields = getSearchableFields(item)
          .map(
            (field) =>
                field.replaceAll(RegExp(r'\s+'), '').trim().toLowerCase(),
          )
          .toList();

      return searchTerms.every(
        (term) => fields.any((field) => field.contains(term)),
      );
    }).toList();
    final totalItems = filtered.length;
    final totalPages = (totalItems / rowsPerPage).ceil();
    if (currentPage >= totalPages && totalPages > 0) {
      currentPage = totalPages - 1;
    }
    if (currentPage < 0) {
      currentPage = 0;
    }
    final start = totalItems == 0 ? 0 : currentPage * rowsPerPage;
    final end = ((start + rowsPerPage) > totalItems)
        ? totalItems
        : (start + rowsPerPage);
    final List<T> paged = totalItems == 0 ? [] : filtered.sublist(start, end);
    return (paged, totalItems, totalPages, start, end);
  }

  static (List<T>, int, int, int, int)
  filterListBySearchAndPageAndStatus<T, E extends Enum>({
    required List<T> items,
    required String search,
    required List<String> Function(T) getSearchableFields,
    required int currentPage,
    required int rowsPerPage,
    required E statusFilter,
    required E noneValue,
    required E Function(T) getStatus,
  }) {
    List<T> filtered = List<T>.from(items);
    if (statusFilter != noneValue) {
      filtered = filtered
          .where((item) => getStatus(item) == statusFilter)
          .toList();
    }
    final (
      paged,
      totalItems,
      totalPages,
      start,
      end,
    ) = filterListBySearchAndPage(
      items: filtered,
      search: search,
      getSearchableFields: getSearchableFields,
      currentPage: currentPage,
      rowsPerPage: rowsPerPage,
    );
    return (paged, totalItems, totalPages, start, end);
  }
}
