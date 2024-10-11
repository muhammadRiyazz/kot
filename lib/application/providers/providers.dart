import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/login%20b/login_bloc.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';


blocProviders() {
  return [
   
    BlocProvider(
      create: (context) => ServerConnBloc(),
    ),
    BlocProvider(
      create: (context) => LoginBloc(),
    ),
  ];
}
