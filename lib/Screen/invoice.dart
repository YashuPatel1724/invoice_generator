import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_generator/Screen/add_product.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:printing/printing.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

List amountList = [];

class _InvoiceState extends State<Invoice> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      amount = 0;
      total = 0;
      for (int i = 0; i < ProductList.length; i++) {
        j = i;
        amount = amount +
            (double.parse(ProductList[i].productPrice!.text) *
                double.parse(ProductList[i].productQty!.text));
      }
      total = total + amount;
      gst = total * 18 / 100;
      pay = gst + total;
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => generatepdf(),
      ),
    );
  }
}

Future<Uint8List> generatepdf() {
  final pdf = pd.Document();
  pdf.addPage(pd.Page(
    pageFormat: PdfPageFormat.a4,
    build: (context) => pd.Center(
      child: pd.Column(
        crossAxisAlignment: pd.CrossAxisAlignment.center,
        children: [
          pd.Text(
            'Balaji Namkeen',
            style: pd.TextStyle(
                color: PdfColors.lightBlueAccent,
                fontWeight: pd.FontWeight.bold,
                fontSize: 40),
          ),
          pd.SizedBox(height: 8),
          pd.Text('67, Uma Plaza Near Police Station Dindoli Surat',
              style: pd.TextStyle(color: PdfColors.black, fontSize: 20)),
          pd.SizedBox(height: 20),
          pd.Divider(thickness: 3, color: PdfColors.black),
          pd.SizedBox(height: 10),
          pd.Text('Invoice',
              style: pd.TextStyle(color: PdfColors.black, fontSize: 30)),
          pd.SizedBox(height: 20),
          pd.Divider(thickness: 2, color: PdfColor.fromHex('#808080')),
          pd.SizedBox(height: 10),
          pd.Row(
            children: [
              pd.Text('iteam',
                  style: pd.TextStyle(color: PdfColors.black, fontSize: 22,fontWeight: pd.FontWeight.bold)),
              pd.SizedBox(
                width: 160,
              ),
              pd.Text('Qty',
                  style: pd.TextStyle(color: PdfColors.black, fontSize: 22,fontWeight: pd.FontWeight.bold)),
              pd.SizedBox(
                width: 50,
              ),
              pd.Text('Price',
                  style: pd.TextStyle(color: PdfColors.black, fontSize: 22,fontWeight: pd.FontWeight.bold)),
              pd.SizedBox(
                width: 50,
              ),
              pd.Text('Amount',
                  style: pd.TextStyle(color: PdfColors.black, fontSize: 22,fontWeight: pd.FontWeight.bold)),

            ],
          ),
          pd.SizedBox(height: 10),
          pd.Divider(
            color: PdfColor.fromHex('#808080'),
            thickness: 2,
          ),
          ...List.generate(
            ProductList.length,
            (index) =>pd.Padding(
              padding: pd.EdgeInsets.only(top: 10),
              child:
              pd.Column(
                  children: [
                    pd.Row(
                      children: [
                        pd.Text('${ProductList[index].productName!.text}',
                            style: pd.TextStyle(color: PdfColors.black, fontSize: 22)),
                        pd.SizedBox(
                          width: 165,
                        ),
                        pd.Text('${ProductList[index].productQty!.text}',
                            style: pd.TextStyle(color: PdfColors.black, fontSize: 22)),
                        pd.SizedBox(
                          width: 75,
                        ),
                        pd.Text('${ProductList[index].productPrice!.text}',
                            style: pd.TextStyle(color: PdfColors.black, fontSize: 22)),
                        pd.SizedBox(
                          width: 70,
                        ),
                        pd.Text(
                            'Rs.${(double.parse(ProductList[index].productPrice!.text) * double.parse(ProductList[index].productQty!.text))}',
                            style: pd.TextStyle(color: PdfColors.black, fontSize: 22)),
                      ],
                    ),
                    pd.SizedBox(height: 10),
                    pd.Divider(color: PdfColor.fromHex('#808080'),thickness: 2)
                  ]
              )
            )
          ),
          pd.SizedBox(height: 30),
          pd.Row(
            children: [
              pd.Text('Sub Total',style: pd.TextStyle(color: PdfColors.black, fontSize: 25)),
              pd.SizedBox(width: 320),
              pd.Text('${total}',style: pd.TextStyle(color: PdfColors.black, fontSize: 25)),
            ],
          ),
          pd.SizedBox(height: 15),
          pd.Row(
            children: [
              pd.Text('Tax',style: pd.TextStyle(color: PdfColors.black, fontSize: 25)),
              pd.SizedBox(width: 385),
              pd.Text('18%',style: pd.TextStyle(color: PdfColors.black, fontSize: 25)),
            ],
          ),
          pd.Divider(
              color: PdfColor.fromHex('#808080'),thickness: 2
          ),
          pd.Row(
            children: [
              pd.SizedBox(height: 20),
              pd.Text('Total Due',style: pd.TextStyle(color: PdfColors.black, fontSize: 25,fontWeight: pd.FontWeight.bold)),
              pd.SizedBox(width: 320),
              pd.Text('${pay}',style: pd.TextStyle(color: PdfColors.black, fontSize: 25,fontWeight: pd.FontWeight.bold)),
            ],
          ),
        ],
      ),
    ),
  ));
  return pdf.save();
}

double amount = 0;
double total = 0;
double gst = 0;
double pay = 0;
int j = 0;
