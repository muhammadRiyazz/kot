part of 'tables_bloc.dart';

@freezed
class TablesState with _$TablesState {
factory TablesState({
    required bool isLoading,
       required List<String> floors,
       String? selectedFloor,
    required   List<TableInfo> tablesinfolist,
 required List<TableModel> tables, 
  }) = _TablesState;
  factory TablesState.initial() {
    return TablesState(tablesinfolist: [],
      tables: [],
      isLoading: false,
     floors: [],
     selectedFloor:  null
    );
  }}
