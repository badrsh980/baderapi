import 'package:api/api/opjapi.dart';
import 'package:api/model/madel.dart';
import 'package:api/screen/object_create_successScreen.dart';
import 'package:flutter/material.dart';

class ObjectFormPage extends StatefulWidget {
  @override
  _ObjectFormPageState createState() => _ObjectFormPageState();
}

class _ObjectFormPageState extends State<ObjectFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cpuModelController = TextEditingController();
  final TextEditingController hardDiskSizeController = TextEditingController();

  Future<void> createObject() async {
    final ObjectModel newObject = ObjectModel(
      id: '0',
      name: nameController.text,
      data: {
        'year': int.parse(yearController.text),
        'price': double.parse(priceController.text),
        'CPU model': cpuModelController.text,
        'Hard disk size': hardDiskSizeController.text,
      },
      createdAt: '',
    );

    try {
      final ObjectModel createdObject =
          await ObjectCreateApi.createObject(newObject);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ObjectCreateSuccessScreen(createdObject: createdObject),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Object'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: yearController,
              decoration: const InputDecoration(labelText: 'Year'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: cpuModelController,
              decoration: const InputDecoration(labelText: 'CPU Model'),
            ),
            TextField(
              controller: hardDiskSizeController,
              decoration: const InputDecoration(labelText: 'Hard Disk Size'),
            ),
            ElevatedButton(
              onPressed: createObject,
              child: const Text('Create Object'),
            ),
          ],
        ),
      ),
    );
  }
}
