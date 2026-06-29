import 'package:flutter/material.dart';
import 'package:study_flow/notes/edit_notes_screen.dart';
import 'package:study_flow/profile/profile.dart';
import 'package:study_flow/subjects/subjects_screen.dart';
import 'package:study_flow/tasks/new_task_screen.dart';
import 'package:study_flow/tasks/task_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text(
                  'Hello, Hanan',style: TextStyle(),
              ),
            ],
          )

        ],
      ),
    );
  }
}
