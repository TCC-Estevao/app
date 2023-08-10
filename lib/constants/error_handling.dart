import 'dart:convert';
import 'dart:developer';

import 'package:app/constants/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
      Response res = response;
      log("Entrou NESSE AQUI ${jsonDecode(response.body)['message']}");
      showSnackBar(context, jsonDecode(response.body)['message'][0]);
      return;
  }
}
