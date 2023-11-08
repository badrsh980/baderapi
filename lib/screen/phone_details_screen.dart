import 'package:api/model/madel.dart';
import 'package:flutter/material.dart';

class PhoneDetailsScreen extends StatelessWidget {
  final Phone phone;

  PhoneDetailsScreen({required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this phone'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ID: ${phone.id}'),
            Text('Name: ${phone.name}'),
            Text(
                'Data: ${phone.data != null ? phone.data.toString() : 'No data'}'),
          ],
        ),
      ),
    );
  }
}
