import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/customerpart/customerpart_bloc.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: BlocBuilder<CustomerpartBloc, CustomerpartState>(
          builder: (context, state) {
            return state.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: mainclr,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                                title: Text(
                                  'Selected Customer',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                                subtitle: Text(
                                  state.selectedcustomer!.bussinessname,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.person_pin_rounded,
                                  color: Colors.white,
                                  size: 35,
                                )),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Divider(
                                height: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Customer Type -',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    state.selectedcustomer!.customerType,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            ' Customers',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                        onTap: () {
                                          BlocProvider.of<CustomerpartBloc>(
                                                  context)
                                              .add(CustomerpartEvent
                                                  .changeSelection(
                                                      selectedcustomer:
                                                          state.customerlist[
                                                              index]));
                                        },
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 5),
                                        title: Text(state
                                            .customerlist[index].bussinessname),
                                        subtitle: Text(state
                                            .customerlist[index].customerType),
                                        trailing: state.selectedcustomer ==
                                                state.customerlist[index]
                                            ? Checkbox(
                                                value: true,
                                                onChanged: (value) {},
                                              )
                                            : null),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: state.customerlist.length)),
                      // MainButton(label: 'Add New Customer', onpress: () {})
                    ],
                  );
          },
        ),
      ),
    );
  }
}
