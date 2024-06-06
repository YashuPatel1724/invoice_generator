import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'invoice.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Home Page',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(onPressed: () {
              Navigator.of(context).pushNamed('/edit');
            }, child: Text('Save',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 25),))
          ],
          centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  TextEditingController txtname = TextEditingController();
                  TextEditingController txtprice = TextEditingController();
                  TextEditingController txtqty = TextEditingController();
                  setState(() {
                    ProductList.add(ProductModel(
                      productName: txtname,
                      productPrice: txtprice,
                      productQty: txtqty,
                    ));
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 50,
                  width: 230,
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Product',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
             ...List.generate(ProductList.length, (index) =>  Container(
               margin: EdgeInsets.all(15),
               height: 300,
               width: 280,
               decoration: BoxDecoration(
                 color: Colors.white10,
                   border: Border.all(color: Colors.black, width: 2),
                 borderRadius: BorderRadius.circular(15)
               ),
               child: Padding(
                 padding: const EdgeInsets.only(top: 20.0, left: 10),
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
                           width: 200,
                           child: TextFormField(
                             style: TextStyle(color: Colors.black),
                             controller: ProductList[index].productName,
                             decoration: InputDecoration(
                               label: Text('product name'),
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
                           width: 200,
                           child: TextFormField(
                             style: TextStyle(color: Colors.black),
                             controller: ProductList[index].productQty,
                             decoration: InputDecoration(
                               label: Text('qty'),
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
                           width: 200,
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
                     Padding(
                       padding: const EdgeInsets.only(top: 20.0,left: 120),
                       child: TextButton(
                           onPressed: () => showDialog(
                             context: context, builder: (context) => AlertDialog(
                             backgroundColor: Colors.white,
                             title: Text('Delete',style: TextStyle(color: Colors.black),),
                             content: Text('Delete your Product!',style: TextStyle(color: Colors.black),),
                             actions: [
                               TextButton(onPressed: () {
                                 Navigator.pop(context);
                               }, child: Text('Cancle',style: TextStyle(color: Colors.lightBlue),)),
                               TextButton(onPressed: () {
                                 setState(() {
                                   ProductList.removeAt(index);
                                 });
                                 Navigator.pop(context);
                               }, child: Text('Ok',style: TextStyle(color: Colors.lightBlue),))
                             ],

                           ),
                           ),
                           child: Text('Remove',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 20),)),
                     )
                   ],
                 ),
               ),
             ),)
            ],
          ),
        ),
      ),
    );
  }
}

List ProductList = [];
class ProductModel
{
  TextEditingController? productName;
  TextEditingController? productPrice;
  TextEditingController? productQty;

  ProductModel({this.productName,this.productPrice,this.productQty});
}
