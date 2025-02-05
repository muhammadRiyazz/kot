import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'support_event.dart';
part 'support_state.dart';
part 'support_bloc.freezed.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportState.initial()) {
    on<GetinfoData>((event, emit) async {
  emit(state.copyWith(isLoading: true));

  try {
    final response = await http.get(Uri.parse('https://www.ballast.in/Restaurant/Support.txt'));

    if (response.statusCode == 200) {
      final responseBody = response.body;
      log(responseBody);

      // Split the response body by newlines and remove empty lines
      final lines = responseBody.split('\n').where((line) => line.trim().isNotEmpty).toList();

      // Ensure there are enough lines in the response
      if (lines.length >= 6) {
        final description = lines[0].trim();
        final websiteUrl = lines[1].trim();
        final phoneNumbers = lines[2].trim().split(',');
        final email = lines[3].trim();
        final workingHours = lines[4].trim();
        final companyName = lines[5].trim();

        final phoneNumber1 = phoneNumbers.isNotEmpty ? phoneNumbers[0].trim() : '';
        final phoneNumber2 = phoneNumbers.length > 1 ? phoneNumbers[1].trim() : '';

        final supportInfo = SupportInfo(
          description: description,
          websiteUrl: websiteUrl,
          phoneNumber1: phoneNumber1,
          phoneNumber2: phoneNumber2,
          email: email,
          workingHours: workingHours,
          companyName: companyName,
        );

        // Log the parsed data
        log('Description: ${supportInfo.description}');
        log('Website URL: ${supportInfo.websiteUrl}');
        log('Phone Number 1: ${supportInfo.phoneNumber1}');
        log('Phone Number 2: ${supportInfo.phoneNumber2}');
        log('Email: ${supportInfo.email}');
        log('Working Hours: ${supportInfo.workingHours}');
        log('Company Name: ${supportInfo.companyName}');

        // Emit the new state with the parsed data
        emit(state.copyWith(isLoading: false, supportInfo: supportInfo));
      } else {
        log('Response body does not have enough lines');
        emit(state.copyWith(isLoading: false));
      }
    } else {
      log('Failed to load data');
      emit(state.copyWith(isLoading: false));
    }
  } catch (e) {
    log('Error fetching: $e');
    emit(state.copyWith(isLoading: false));
  }
});

  }
}

class SupportInfo {
  final String description;
  final String websiteUrl;
  final String phoneNumber1;
  final String phoneNumber2;
  final String email;
  final String workingHours;
  final String companyName;

  SupportInfo({
    required this.description,
    required this.websiteUrl,
    required this.phoneNumber1,
    required this.phoneNumber2,
    required this.email,
    required this.workingHours,
    required this.companyName,
  });
}
