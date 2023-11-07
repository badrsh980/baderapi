import 'package:api/api/opjapi.dart';
import 'package:api/model/madel.dart';
import 'package:api/screen/object_details_screen.dart';
import 'package:flutter/material.dart';

class ObjectList extends StatefulWidget {
  @override
  _ObjectListState createState() => _ObjectListState();
}

class _ObjectListState extends State<ObjectList> {
  List<ObjectModel> objects = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<ObjectModel> data = await ObjectApi.fetchObjects();
      setState(() {
        objects = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Object List'),
      ),
      body: ListView.builder(
        itemCount: objects.length,
        itemBuilder: (context, index) {
          final object = objects[index];
          return ListTile(
            title: Text(object.name),
            subtitle:
                Text(object.data != null ? object.data.toString() : 'No data'),
            onTap: () {
              // Navigate to the details screen and pass the selected object
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ObjectDetailsScreen(object: object),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
