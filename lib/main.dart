import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/Dilog%20%20box/dilogebox.dart';
import 'package:invoice_generator/Screen/add_product.dart';
import 'package:invoice_generator/Screen/edit.dart';
import 'package:invoice_generator/Screen/invoice.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/' : (context) => Product(),
        '/edit' : (context) => EditScreen(),
        '/in' : (context) => Invoice(),
      },
      // initialRoute: '/',
      //
      // routes: {
      //   '/' : (context) => DilogeBox(),
      // },
    );
  }
}
