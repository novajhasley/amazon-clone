import 'dart:convert';

import 'package:amazon_clone_tutorial/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context, //snackBar
  required VoidCallback onSuccess, //try catch success callback
}) {
  switch (response.statusCode) {
    case 200: //success
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500: //error
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
      break;
  }
}
