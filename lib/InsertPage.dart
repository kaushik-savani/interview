import 'package:flutter/material.dart';

class Insertpage extends StatefulWidget {
  const Insertpage({Key? key}) : super(key: key);

  @override
  State<Insertpage> createState() => _InsertpageState();
}

class _InsertpageState extends State<Insertpage> {

  List<String> b=["Surat","Vadodara"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: double.infinity,
                alignment: Alignment.center,
                margin: EdgeInsets.only(),
                height: 30,
                color: Colors.black54,
                child: Text("ADD ADDRESS",style: TextStyle(color: Colors.white),)),
            

          ],
        ),
      )),
    );
  }
}
