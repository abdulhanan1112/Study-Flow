import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_flow/models/notes_model.dart';
import 'package:study_flow/models/tasks_model.dart';


class TasksService {
  final String uid;
  int count=0;

  TasksService({required this.uid});

  //  instance of collection
  final CollectionReference _usersInstance= FirebaseFirestore.instance.collection('Users');

  // add notes for specific subject
  Future<void> addTasks(String subjectId,String description,String title,String subject,String deadline,int priority)async{
    try{
      await _usersInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Tasks').add(
          {
            'title':title,
            'description' :description,
            'deadline' : deadline,
            'subject' : subject,
            'priority' :priority
          }

      );
      count++;
    }catch(e)
    {
      print(e.toString());
    }
  }

  // get list of notes
  Future<List<TasksModel>> getTasks(String subjectId)async{
    final notes= await _usersInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Tasks').get();
    return notes.docs.map((task){
      return TasksModel(taskId:task.id, priority:task['priority'], deadline: task['deadline'], description: task['description'], title: task['title'], subject: task['subjects']);
    }).toList();
  }

  //delete the notes
  void deleteTasks(String taskId,String subjectId)async{
    await _usersInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Tasks').doc(taskId).delete();
    count--;

  }

}