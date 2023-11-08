import 'package:api/model/madel.dart';
import 'package:api/screen/new_phone_create_success.dart';
import 'package:flutter/material.dart';

class NewPhonePage extends StatefulWidget {
  @override
  _NewPhonePageState createState() => _NewPhonePageState();
}

class _NewPhonePageState extends State<NewPhonePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController cpuModelController = TextEditingController();
  final TextEditingController hardDiskSizeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Phone'),
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
              onPressed: () async {
                try {
                  final createdPhone = await Phone.createPhone(
                    name: nameController.text,
                    year: int.parse(yearController.text),
                    price: double.parse(priceController.text),
                    cpuModel: cpuModelController.text,
                    hardDiskSize: hardDiskSizeController.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ObjectCreateSuccessScreen(
                          PrintNewPhone: createdPhone),
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              },
              child: const Text('Create Phone'),
            ),
          ],
        ),
      ),
    );
  }
}
