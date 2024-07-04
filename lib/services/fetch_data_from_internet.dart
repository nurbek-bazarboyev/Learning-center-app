import 'dart:convert';
import 'package:http_parser/http_parser.dart' show parse;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getData(String url)async{
  final response = await http.get(Uri.parse(url));

  if(response.statusCode == 200){

    return response;
  }else{
    throw Exception("Nosozlik iltimos boshqattan urinib ko'ring");
  }
}