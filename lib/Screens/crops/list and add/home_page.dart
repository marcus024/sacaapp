import 'package:flutter/material.dart';
import 'package:saca/Screens/crops/list and add/add_student_page.dart';
import 'package:saca/Screens/crops/list and add/list_student_page.dart';

class cropsPage extends StatefulWidget {
  cropsPage({Key? key}) : super(key: key);

  @override
  _cropsPageState createState() => _cropsPageState();
}

class _cropsPageState extends State<cropsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Flutter FireStore CRUD'),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddStudentPage(),
                  ),
                )
              },
              child: Text('Add', style: TextStyle(fontSize: 20.0)),
              style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
            )
          ],
        ),
      ),
      body: ListStudentPage(),
    );
  }
}
