import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:interview/InsertPage.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  List l = [];

  bool status = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var url = Uri.parse('http://workfordemo.in/bunch3/get_address.php');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body)["address_list"];
    //jsonMap = json.decode(jsonString);

    setState(() {
      status = true;
    });
    print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ALL ADRESS"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return Insertpage();
                },
              ));
            },
            child: Text("Add")),
        body: status
            ? ListView.builder(
                itemCount: l.length,
                itemBuilder: (context, index) {
                  model m = model.fromJson(l[index]);
                  return ListTile(
                    title: Text("Adress:${(m.addressId)}",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${m.gpsAddress}"),
                    trailing:
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}

class model {
  String? addressId;
  String? addressType;
  String? gpsAddress;
  String? latitude;
  String? longitude;
  String? mobile;
  String? name;
  String? created;

  model(
      {this.addressId,
      this.addressType,
      this.gpsAddress,
      this.latitude,
      this.longitude,
      this.mobile,
      this.name,
      this.created});

  model.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressType = json['address_type'];
    gpsAddress = json['gps_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mobile = json['mobile'];
    name = json['name'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_type'] = this.addressType;
    data['gps_address'] = this.gpsAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['created'] = this.created;
    return data;
  }
}
