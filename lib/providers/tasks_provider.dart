import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/models/tasks_model.dart';
import 'package:study_flow/providers/subject_provider.dart';
import 'package:study_flow/services/tasks_service.dart';

final user=FirebaseAuth.instance.currentUser;


//task Provider
final taskProvider=Provider((ref){
  return TasksService(uid: user!.uid);
});

final listOfTaskProvider=FutureProvider.family<List<TasksModel>,String>((ref,sid){
  final obj=ref.read(taskProvider);
  return obj.getTasks(sid);

});



//total tasks
final FutureProvider<List<TasksModel>> totalTasksProvider=FutureProvider((ref)async {
  final subjectService=ref.read(SubjectServicesProv);
  final taskService=ref.read(taskProvider);
  final subjects=await subjectService.getSubject();
  print("Subjects: ${subjects.length}");
  final result=await Future.wait(subjects.map((s){
    return taskService.getTasks(s.sid);
  }));

   return result.expand((tasks) => tasks).toList();
});