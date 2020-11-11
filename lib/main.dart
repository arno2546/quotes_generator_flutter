import 'package:flutter/material.dart';
import 'quotes.dart';

void main(){
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>QuotesGen(),
    },
  ));
}