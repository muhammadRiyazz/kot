import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mssql_connection/mssql_connection.dart';
import 'package:restaurant_kot/core/conn.dart';
import 'package:restaurant_kot/domain/cus/customer_model.dart';
part 'customerpart_event.dart';
part 'customerpart_state.dart';
part 'customerpart_bloc.freezed.dart';

class CustomerpartBloc extends Bloc<CustomerpartEvent, CustomerpartState> {
  CustomerpartBloc() : super(CustomerpartState.initial()) {
    // List<Customerslist> customerslist = [];

    on<CFetchlist>((event, emit) async {
      emit(state.copyWith(isLoading: true, customerlist: []));
      try {
        MSSQLConnectionManager connectionManager = MSSQLConnectionManager();
        MssqlConnection connection = await connectionManager.getConnection();

        String query =
            "SELECT cusid, bussinessname, bussinessaddr,gstno ,CustomerTYPE FROM dbo.CustomerDetails";

        String? result = await connection.getData(query);

        log('------result---------------000000--------${result}');
        List<CustomerDetails> customerList = (jsonDecode(result) as List)
            .map((data) => CustomerDetails.fromJson(data))
            .toList();

        emit(state.copyWith(
            customerlist: customerList,
            isLoading: false,
            selectedcustomer: customerList[0]));
      } catch (e) {
        emit(state.copyWith(isLoading: false, customerlist: []));
        log('Error: CustomerDetails --$e');
      }
    });

    on<ChangeSelection>((event, emit) async {
      emit(state.copyWith(selectedcustomer: event.selectedcustomer));
    });
  }
}
