import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/Screen/add_product.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

List amountList = [];

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1B1F),
      appBar: AppBar(
        backgroundColor: Color(0xff1C1B1F),
        leading: InkWell(
          onTap: () {

            Navigator.of(context).pop();
          },
            child: Icon(CupertinoIcons.back,color: Colors.white,)),
        title: Text(
          'Invoice',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Colors.white, width: 1),
                children: [
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Iteams',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ProQty',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'ProPrice',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Amount',
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  ...List.generate(
                    ProductList.length,
                    (index) => TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${ProductList[index].productName!.text}',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${ProductList[index].productQty!.text}',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${ProductList[index].productPrice!.text}',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${amountList[index]}',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 250,),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total : ',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('${total}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('GST : ',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('18%',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 10,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Pay : ',style: TextStyle(color: Colors.red,fontSize: 25,fontWeight: FontWeight.bold),),
                  Text('${pay}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),)
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
double amount = 0;
double total = 0;
double gst = 0;
double pay = 0;