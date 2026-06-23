import 'package:flutter/material.dart';

class OpenNotesScreen extends StatelessWidget {
  String? title;
   OpenNotesScreen({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        actions: [
          TextButton.icon(onPressed: (){

          },
            icon: Icon(Icons.delete),
            label:Text('delete'),
          ),
        ],

      ),
    );
  }
}
