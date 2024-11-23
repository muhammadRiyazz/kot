part of 'customerpart_bloc.dart';

@freezed
class CustomerpartState with _$CustomerpartState {
  factory CustomerpartState(
      {required bool isLoading,
  

      required    List<CustomerDetails> customerlist,
      CustomerDetails? selectedcustomer
      }) = _CustomerpartState;
  factory CustomerpartState.initial() {
    return CustomerpartState( isLoading: false, customerlist: [],selectedcustomer: null);
  }
}
