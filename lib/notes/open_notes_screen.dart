import 'package:flutter/material.dart';

class OpenNotesScreen extends StatelessWidget {
  const OpenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final map=ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final String title=map['title']!;
    final String notes=map['content']!;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
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
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Text(notes),
        ),
      ),
    );
  }
}
