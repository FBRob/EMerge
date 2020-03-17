import 'package:flutter/material.dart';

class MedicalPage extends StatefulWidget {
  @override
  _MedicalPageWidgetState createState() => _MedicalPageWidgetState();
}

class _MedicalPageWidgetState extends State<MedicalPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      //blue header
      appBar: AppBar(
        title: Text('Medical Report'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //TODO Remember later to center these and to add the scrolling functionality to the screen and put column inside it
            //TODO Also add the drop downs and stuff later
            //TODO Once this is all done and we have the http methods and stuff add them later and maybe have it make a json file on submit
            //TODO Add the drop down menus and fill them with info
            //TODO Make the text boxes nice and put extra info in them if needed
            //TODO Add other things need for the text boxes and drop downs
            //TODO Make the submit button work
            Text(
              "Please Select What Services are Required as well(Defaults to Just Medical)",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
            DropdownButton<String>(
              hint: Text('No other Assistance is needed'),
              items: <String>['Fire', 'Police', 'Figure out more and change previous'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {},
            ),
            Text(
              "Please Select Type of Report",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
            DropdownButton<String>(
              hint: Text('No report type is selected'),
              items: <String>['Fire', 'Police'].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            Text(
              "Please enter your name otherwise this will be submitted Anonymously",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
            TextFormField(
              textAlign: TextAlign.left,
              autocorrect: false,
              showCursor: true,
              decoration: new InputDecoration.collapsed(
                  hintText: "Please enter your name"),
            ),
            Text(
              "Please submit your phone number(Not required)",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
            TextFormField(
              textAlign: TextAlign.left,
              autocorrect: false,
              showCursor: true,
              decoration: new InputDecoration.collapsed(
                  hintText: "Please enter phone number"),
            ),
            Text(
              "Enter any additional information below",
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
            ),
            TextFormField(
              textAlign: TextAlign.left,
              autocorrect: true,
              showCursor: true,
              decoration: new InputDecoration.collapsed(
                  hintText: "Enter any other information"),
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
    ));
  }
}
