import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DilogeBox extends StatefulWidget {
  const DilogeBox({super.key});

  @override
  State<DilogeBox> createState() => _DilogeBoxState();
}

class _DilogeBoxState extends State<DilogeBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alert Diloge',
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Color(0xff1C1B1F),
                    title: Text(
                      'Diloge Box',
                      style: TextStyle(color: Colors.white),
                    ),
                    content: Text(
                      'AlertDialog description',
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancle')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Ok'))
                    ],
                  ),
                );
              },
              child: Text(
                'Show DilogeBox',
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog.fullscreen(
                    backgroundColor: Color(0xff1C1B1F),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                                  'name',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                                  'Surname',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(height: 10,),
                          TextField(
                            decoration: InputDecoration(
                                label: Text(
                                  'phone',
                                  style: TextStyle(color: Colors.white),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 20),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 20),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                'Show DilogeBox full screen',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
