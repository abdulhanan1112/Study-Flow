import 'package:flutter/material.dart';

class OpenNotesScreen extends StatelessWidget {
  const OpenNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final map=ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final String title=map['title']!;
    final notes=map['content']!;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,

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
