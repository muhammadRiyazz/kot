part of 'customerpart_bloc.dart';

@freezed
class CustomerpartEvent with _$CustomerpartEvent {
  // const factory CustomerpartEvent.add({
  //   required String name,
  //   required String addr,
  //   required String email,
  //   required String phone,
  //   required String gst,
  //   required String state,
  //   required String district,
  //   required String id,
  // }) = Add;
  const factory CustomerpartEvent.cfetchlist() = CFetchlist;
  const factory CustomerpartEvent.changeSelection(
      {required CustomerDetails selectedcustomer}) = ChangeSelection;

  // const factory CustomerpartEvent.selectBiller(
  //     {required Customerslist biller}) = SelectBiller;
  // const factory CustomerpartEvent.removeBiller() = RemoveBiller;
  // const factory CustomerpartEvent.searchCustomer({required String query}) =
  //     SearchCustomer;
  // const factory CustomerpartEvent.editdata({
  //   required String name,
  //   required String addr,
  //   required String email,
  //   required String phone,
  //   required String gst,
  //   required String state,
  //   required String district,
  //   required String id,
  // }) = Editdata;
  // const factory CustomerpartEvent.remarklist({
  //   required String cusId,
  // }) = Remarklist;
  // const factory CustomerpartEvent.addremark({RemartData? editdata,
  //    String? name,
  //    String? cusId,
  //    String? remark,
  //    String? desc,
  // }) = Addremark;
}
