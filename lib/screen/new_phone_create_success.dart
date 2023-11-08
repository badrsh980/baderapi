import 'package:api/model/madel.dart';
import 'package:flutter/material.dart';

class ObjectCreateSuccessScreen extends StatelessWidget {
  final Phone PrintNewPhone;

  ObjectCreateSuccessScreen({required this.PrintNewPhone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Phone'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ID: ${PrintNewPhone.id}'),
            Text('Name: ${PrintNewPhone.name}'),
            Text('Year: ${PrintNewPhone.data?['year']}'),
            Text('Price: ${PrintNewPhone.data?['price']}'),
            Text('CPU Model: ${PrintNewPhone.data?['CPU model']}'),
            Text('Hard Disk Size: ${PrintNewPhone.data?['Hard disk size']}'),
            Text('Created At: ${PrintNewPhone.createdAt}'),
          ],
        ),
      ),
    );
  }
}
