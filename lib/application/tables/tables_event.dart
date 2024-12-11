part of 'tables_bloc.dart';

@freezed
class TablesEvent with _$TablesEvent {
    const factory TablesEvent.select({required String tablename,}) = Select;

  const factory TablesEvent.taledata() = TableData;
    const factory TablesEvent.chooseFloor({required String floor}) = ChooseFloor;
  const factory TablesEvent.change({required String tablename,required String orderNo,}) = Change;


}