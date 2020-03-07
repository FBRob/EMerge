import 'package:flutter/material.dart';
class PolicePage extends StatefulWidget{
  @override
  _PolicePageWidgetState createState() => _PolicePageWidgetState();

}

class _PolicePageWidgetState extends State<PolicePage> {
  @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Police Report'),
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
                //TODO Add the drop down menus and fill them with info
                //TODO Make the text boxes nice and put extra info in them if needed
                //TODO Add other things need for the text boxes and drop downs
                //TODO Make the submit button work
                  Text(
                      "Please Select What Services are Required(Defaults to Just Medical)",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  Text(
                      "Please Select What Services are Required",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  Text(
                      "Please Select Type of Report",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  Text(
                      "Please enter your name otherwise this will be submitted Anonymously",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  TextFormField(textAlign: TextAlign.left, autocorrect: true, showCursor: true

                  ),
                  Text(
                      "Please submit your phone number(Not required)",
                      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  TextFormField(textAlign: TextAlign.left, autocorrect: true, showCursor: true

                  ),
                  Text(
                      "Enter any additional information below",
                       style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
                  ),
                  TextFormField(textAlign: TextAlign.left, autocorrect: true, showCursor: true

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
      ),
    );
  }


}