import 'package:api/model/madel.dart';
import 'package:flutter/material.dart';

class ObjectDetailsScreen extends StatelessWidget {
  final ObjectModel object;

  ObjectDetailsScreen({required this.object});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Object Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('ID: ${object.id}'),
            Text('Name: ${object.name}'),
            Text(
                'Data: ${object.data != null ? object.data.toString() : 'No data'}'),
          ],
        ),
      ),
    );
  }
}
