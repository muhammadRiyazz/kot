part of 'tables_bloc.dart';

@freezed
class TablesState with _$TablesState {
  factory TablesState({
    String? selectedtable,

    required bool isLoading,
    required bool changed,
    required List<String> floors,
    String? selectedFloor,
    required List<TableInfo> tablesinfolist,
    required List<TableModel> tables,
  }) = _TablesState;
  factory TablesState.initial() {
    return TablesState(
        tablesinfolist: [],
        changed: true,
        tables: [],
        
        isLoading: false,
        floors: [],
        selectedFloor: null);
  }
}
