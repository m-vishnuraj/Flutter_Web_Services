import 'package:http/http.dart' as http;
import 'dart:developer';

Future<void> getNumberFact({required int number}) async {
  final response = await http.get(Uri.parse('http://numbersapi.com/19?json'));
  log(response.body);
}
