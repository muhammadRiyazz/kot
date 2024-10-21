import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/items%20To%20Kot/items_to_kot_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/order%20details/order_details_bloc.dart';
import 'package:restaurant_kot/application/orders/orders_bloc.dart';
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
      create: (context) => ItemsToKotBloc(),
    ),
    BlocProvider(
      create: (context) => OrderDetailsBloc(),
    ),
    BlocProvider(
      create: (context) => StockBloc(),
    ),
  ];
}
