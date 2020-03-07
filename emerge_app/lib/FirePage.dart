

import 'package:flutter/material.dart';
class FirePage extends StatefulWidget{
  @override
  _FirePageWidgetState createState() => _FirePageWidgetState();

}

class _FirePageWidgetState extends State<FirePage> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fire Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Text(
              "Please Select What Services are Required(Defaults to just Fire Report)",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please select what additional services are required",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please Select Type of Report",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please enter your name otherwise this will be submitted Anonymously",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Please submit your phone number(Not required)",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Enter any additional information below",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Center(
              child: RaisedButton(
                child: Text('Submit'),
                onPressed: () {
                  // Add Submission results later

                },
              ),
            ),
          ],
        ),

      ),
    );
  }


}