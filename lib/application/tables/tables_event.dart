part of 'tables_bloc.dart';

@freezed
class TablesEvent with _$TablesEvent {
  const factory TablesEvent.taledata() = TableData;
    const factory TablesEvent.chooseFloor({required String floor}) = ChooseFloor;

}