import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_flow/models/tasks_model.dart';


class TasksService {
  final String uid;
  int count=0;

  TasksService({required this.uid});

  //  instance of user collection
  final CollectionReference _usersInstance= FirebaseFirestore.instance.collection('Users');

  // add tasks for specific subject
  Future<void> addTasks(String subjectId,String description,String title,String subject,DateTime deadline)async{
    try{
      await _usersInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Tasks').add(
          {
            'title':title,
            'description' :description,
            'deadline' : deadline,
            'subject' : subject,
          }

      );
      count++;
    }catch(e)
    {
      print(e.toString());
      print("tasks aer not added");
    }
  }

  // get list of Tasks
  Future<List<TasksModel>> getTasks(String subjectId)async{
    final notes= await _usersInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Tasks').get();
    return notes.docs.map((task){
      return TasksModel(taskId:task.id,
          deadline: task['deadline'].toDate(),
          description: task['description'],
          title: task['title'],
          subject: task['subject']);
    }).toList();
  }

  //delete the Tasks
  void deleteTasks(String taskId,String subjectId)async{
    await _usersInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Tasks').doc(taskId).delete();
    count--;

  }

}