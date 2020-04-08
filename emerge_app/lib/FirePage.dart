import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class FirePage extends StatefulWidget {
  @override
  _FirePageWidgetState createState() => _FirePageWidgetState();
}

class _FirePageWidgetState extends State<FirePage> {
  Geolocator geolocator = Geolocator();
  Position userLocation;
  @override
  initState() {
    super.initState();
  }

  String service; //service selected in the drop down
  String report; //what type of report is selected
  @override
  Widget build(BuildContext context) {
    final myControllerName = TextEditingController();
    final myControllerNumber = TextEditingController();
    final myControllerAdditionalInformation = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fire Page'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context, 3);
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
              //TODO add a verification pop up before they submit the report
              Text(
                "Please Select What Services are Required as well(Defaults to Just Fire)",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              DropdownButton<String>(
                //Service drop down
                hint: Text('Please Choose One'),
                items:
                    <String>['None', 'Medical', 'Police'].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String changed) {
                  service = changed;
                  setState(() {});
                },
                value: service,
              ),
              Text(
                "Please Select What Services are Required",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              DropdownButton<String>(
                //report drop down
                hint: Text('No report type is selected'),
                items: <String>['Fire', 'Gas Leak', 'Figure out more']
                    .map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String changed) {
                  report = changed;
                  setState(() {});
                },
                value: report,
              ), //DropdownButton
              Text(
                "Please enter your name otherwise this will be submitted Anonymously",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              TextFormField(
                controller: myControllerName,
                textAlign: TextAlign.left,
                autocorrect: false,
                showCursor: true,
                toolbarOptions: ToolbarOptions(
                  cut: false,
                  copy: false,
                  selectAll: true,
                  paste: false,
                ),
                decoration: new InputDecoration.collapsed(
                    hintText: "Please enter your name"),
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(45),
                  WhitelistingTextInputFormatter(new RegExp(
                      '[A-Za-z\\s]')), //This will allow for letters and periods
                  //BlacklistingTextInputFormatter(new RegExp('[\\,]')), //This stops commas and periods
                ],
              ),
              Text(
                "Please submit your phone number(Not required)",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              TextFormField(
                controller: myControllerNumber,
                textAlign: TextAlign.left,
                autocorrect: false,
                showCursor: true,
                keyboardType: TextInputType.number,
                toolbarOptions: ToolbarOptions(
                  cut: false,
                  copy: false,
                  selectAll: true,
                  paste: false,
                ),
                decoration: new InputDecoration.collapsed(
                    hintText: "Please enter phone number"),
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(14),
                  WhitelistingTextInputFormatter.digitsOnly,
                  //WhitelistingTextInputFormatter(new RegExp('[\\-,1,2,3,4,5,6,7,8,9,0]')) //This will allow for numbers and -
                ],
              ),
              Text(
                "Enter any additional information below",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.normal),
              ),
              TextFormField(
                controller: myControllerAdditionalInformation,
                textAlign: TextAlign.left,
                autocorrect: true,
                showCursor: true,
                toolbarOptions: ToolbarOptions(
                  cut: false,
                  copy: false,
                  selectAll: true,
                  paste: false,
                ),
                decoration: new InputDecoration.collapsed(
                    hintText: "Enter any other information (256 max)"),
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(256),
                  WhitelistingTextInputFormatter(new RegExp(
                      '[A-Za-z\\.\\s]')), //This will allow for letters and periods
                  //BlacklistingTextInputFormatter(new RegExp('[\\,\\.]')), //This stops commas and periods
                ],
              ),
              Center(
                child: RaisedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    _getLocation().then((value) {
                      setState(() {
                        userLocation = value;
                      });
                    });
                    String encodeName;
                    String encodeNumber;
                    String encodedAdditional;
                    String encodedService;
                    String encodedReport;
                    String encodedLocation;
                    encodedService = service;
                    encodedReport = report;
                    encodeName = myControllerName.text;
                    encodeNumber = myControllerNumber.text;
                    encodedAdditional = myControllerAdditionalInformation.text;
                    encodedLocation = userLocation.toString();
                    var values = {
                      'location': encodedLocation,
                      'Service': "Fire," + encodedService,
                      'Report': encodedReport,
                      'name': encodeName,
                      'phone': encodeNumber,
                      'message': encodedAdditional
                    };
                    final string = json.encode(values);
                    //TODO Add Submission results later
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the user has entered by using the
                          // TextEditingController.
                          content: Text(string),
                        );
                      },
                    );
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

Future<Position> _getLocation() async {
  var currentLocation;
  try {
    currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    currentLocation = null;
  }
  return currentLocation;
}
