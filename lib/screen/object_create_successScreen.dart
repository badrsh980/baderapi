import 'package:api/model/madel.dart';
import 'package:flutter/material.dart';

class ObjectCreateSuccessScreen extends StatelessWidget {
  final ObjectModel createdObject;

  ObjectCreateSuccessScreen({required this.createdObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Object Created'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ID: ${createdObject.id}'),
            Text('Name: ${createdObject.name}'),
            Text('Year: ${createdObject.data?['year']}'),
            Text('Price: ${createdObject.data?['price']}'),
            Text('CPU Model: ${createdObject.data?['CPU model']}'),
            Text('Hard Disk Size: ${createdObject.data?['Hard disk size']}'),
            Text('Created At: ${createdObject.createdAt}'),
          ],
        ),
      ),
    );
  }
}
