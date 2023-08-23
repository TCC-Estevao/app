import 'dart:convert';

import 'package:app/constants/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();

      break;
    default:
      showSnackBar(context, jsonDecode(response.body)['message'][0]);
      return;
  }
}
