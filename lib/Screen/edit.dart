import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:invoice_generator/Screen/add_product.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text(
          'Product List',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/in');
              },
                child: Icon(Icons.picture_as_pdf_rounded,color: Colors.white,size: 30,)),
          )
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 10, right: 10),
        child: Column(
          children: [
            ...List.generate(
              ProductList.length,
              (index) => Container(
                margin: EdgeInsets.all(5),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: Colors.lightBlueAccent, width: 2.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0, top: 13),
                          child: Text(
                            '${ProductList[index].productName!.text}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '${ProductList[index].productQty!.text} Qty',
                            style: TextStyle(color: Colors.black38, fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Rs.${ProductList[index].productPrice!.text}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: InkWell(
                            onTap:() {
                              setState(() {
                                showDialog(
                                  context: context, builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Center(child: Text('Edit Iteam',style: TextStyle(color: Colors.black,fontSize: 20),)),
                                  content:Container(
                                    height: 250,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.cart,
                                              color: Colors.lightBlueAccent,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 180,
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                controller: ProductList[index].productName,
                                                decoration: InputDecoration(
                                                  label: Text('Product name'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.cart,
                                              color: Colors.lightBlueAccent,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 180,
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                controller: ProductList[index].productQty,
                                                decoration: InputDecoration(
                                                  label: Text('Qty'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.currency_rupee,
                                              color: Colors.lightBlueAccent,
                                              size: 25,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            SizedBox(
                                              width: 180,
                                              child: TextFormField(
                                                style: TextStyle(color: Colors.black),
                                                controller: ProductList[index].productPrice,
                                                decoration: InputDecoration(
                                                  label: Text('product price'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text('Cancle',style: TextStyle(color: Colors.lightBlue),)),
                                    TextButton(onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    }, child: Text('Save',style: TextStyle(color: Colors.lightBlue),))
                                  ],
                                ),
                                );
                              });
                            },
                            child: Container(
                              height: 35,
                              width: 75,
                              decoration: BoxDecoration(
                                color: Colors.lightBlueAccent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Edit',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
