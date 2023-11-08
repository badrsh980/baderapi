import 'package:api/model/madel.dart';
import 'package:api/screen/phone_details_screen.dart';
import 'package:flutter/material.dart';

class PhoneList extends StatefulWidget {
  @override
  _PhoneListState createState() => _PhoneListState();
}

class _PhoneListState extends State<PhoneList> {
  List<Phone> Phones = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<Phone> data = await Phone.getPhone();
      setState(() {
        Phones = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone List'),
      ),
      body: ListView.builder(
        itemCount: Phones.length,
        itemBuilder: (context, index) {
          final Phone = Phones[index];
          return ListTile(
            title: Text(Phone.name),
            subtitle:
                Text(Phone.data != null ? Phone.data.toString() : 'No data'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhoneDetailsScreen(phone: Phone),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
