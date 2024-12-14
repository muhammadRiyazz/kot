import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/BillSubmitPrint/bill_submit_print_bloc.dart';
import 'package:restaurant_kot/application/KotSubmitPrint/kot_submit_print_bloc.dart';
import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/application/finished%20order/finishad_order_bloc.dart';
import 'package:restaurant_kot/application/initalData/inital_data_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
import 'package:restaurant_kot/application/printer%20setup/printer_setup_bloc.dart';
import 'package:restaurant_kot/application/printing/printing_bloc.dart';
import 'package:restaurant_kot/application/restore%20bill/restore_bill_bloc.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';
import 'package:restaurant_kot/application/stock/stock_bloc.dart';
import 'package:restaurant_kot/application/tables/tables_bloc.dart';

blocProviders() {
  return [
    BlocProvider(
      create: (context) => ServerConnBloc(),
    ),
    BlocProvider(
      create: (context) => LoginBloc(),
    ),
    BlocProvider(
      create: (context) => TablesBloc(),
    ),
    BlocProvider(
      create: (context) => OrdersBloc(),
    ),
    BlocProvider(
      create: (context) => KotSubmitPrintBloc(),
    ),
    BlocProvider(
      create: (context) => OrderDetailsBloc(),
    ),
    BlocProvider(
      create: (context) => StockBloc(),
    ),
    BlocProvider(
      create: (context) => InitalDataBloc(),
    ),
    BlocProvider(
      create: (context) => PrinterSetupBloc(),
    ),
    BlocProvider(
      create: (context) => CustomerpartBloc(),
    ),
    BlocProvider(
      create: (context) => BillSubmitPrintBloc(),
    ),
    BlocProvider(
      create: (context) => FinishadOrderBloc(),
    ),
    BlocProvider(
      create: (context) => RestoreBillBloc(),
    ),
    BlocProvider(
      create: (context) => PrintingBloc(),
    ),
  ];
}
