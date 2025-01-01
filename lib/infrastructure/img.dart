import 'dart:developer';

import 'package:restaurant_kot/domain/cus/customer_model.dart';
import 'package:http/http.dart' as http;

Future<String?> fetchImageUrl(String itemCode) async {
  final List<String> extensions = ['jpg', 'jpeg', 'png'];
  for (final ext in extensions) {
    final url = 'http://$ipid/$itemCode.$ext';
    log(url.toString());
    final response = await http.head(Uri.parse(url));
    if (response.statusCode == 200) {
      return url; // Return the first successful URL
    }
  }
  return null; // No valid URL found
}
