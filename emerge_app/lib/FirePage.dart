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
          title: Text('Page 3'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }


}