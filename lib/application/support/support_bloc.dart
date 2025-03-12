import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:excel/excel.dart';

part 'support_event.dart';
part 'support_state.dart';
part 'support_bloc.freezed.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportState.initial()) {
    on<GetinfoData>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      try {
        final response = await http
            .get(Uri.parse('https://www.ballast.in/Restaurant/Company.xlsx'));

        if (response.statusCode == 200) {
          final bytes = response.bodyBytes;
          final excel = Excel.decodeBytes(bytes);

          // Get the first sheet
          final sheet = excel.tables[excel.tables.keys.first];

          if (sheet == null || sheet.rows.length < 2) {
            log('Excel sheet is empty or lacks data rows');
            emit(state.copyWith(isLoading: false));
            return;
          }

          // Extract values from the second row (skip headers)
          final row = sheet.rows[1];

          final companyName = row[0]?.value.toString() ?? '';
          final description = row[1]?.value.toString() ?? '';
          final websiteUrl = row[2]?.value.toString() ?? '';
          final email = row[3]?.value.toString() ?? '';
          final contactData = row[4]?.value.toString() ?? '';
          final workingHours = row[5]?.value.toString() ?? '';

          // Dynamically extract all phone numbers
          List<String> phoneNumbers = contactData
              .split(RegExp(r'[\n,;]')) // Splitting on newlines, commas, or semicolons
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty) // Remove empty values
              .toList();

          final supportInfo = SupportInfo(
            companyName: companyName,
            description: description,
            websiteUrl: websiteUrl,
            phoneNumbers: phoneNumbers, // Store all phone numbers dynamically
            email: email,
            workingHours: workingHours,
          );

          log('Company Name: ${supportInfo.companyName}');
          log('Description: ${supportInfo.description}');
          log('Website URL: ${supportInfo.websiteUrl}');
          log('Phone Numbers: ${supportInfo.phoneNumbers.join(", ")}');
          log('Email: ${supportInfo.email}');
          log('Working Hours: ${supportInfo.workingHours}');

          emit(state.copyWith(isLoading: false, supportInfo: supportInfo));
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
  final String companyName;
  final String description;
  final String websiteUrl;
  final List<String> phoneNumbers; // Dynamic list of phone numbers
  final String email;
  final String workingHours;

  SupportInfo({
    required this.companyName,
    required this.description,
    required this.websiteUrl,
    required this.phoneNumbers,
    required this.email,
    required this.workingHours,
  });
}
