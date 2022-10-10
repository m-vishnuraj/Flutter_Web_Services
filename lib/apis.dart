import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_sample/number_fact_resp/number_fact_resp.dart';

Future<NumberFactResp> getNumberFact({required String number}) async {
  final response =
      await http.get(Uri.parse('http://numbersapi.com/$number?json'));
  final bodyAsJson = jsonDecode(response.body) as Map<String, dynamic>;
  final data = NumberFactResp.fromJson(bodyAsJson);
  return data;
}
