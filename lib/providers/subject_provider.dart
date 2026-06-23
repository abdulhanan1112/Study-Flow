import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/models/subject_model.dart';
import 'package:study_flow/providers/auth_provider.dart';
import 'package:study_flow/services/subject_service.dart';

// provider to add subjects
final SubjectProvider=Provider<SubjectService>((ref)=> SubjectService()
);

//get current user id for our listOfSubjectsProvider
final SubjectServicesProv=Provider((ref){
  final  user=ref.watch(getCurrentUser);
  return SubjectService(uid:user!.uid);
});

// provider for display Subjects

final listOfSubjectProvider =
FutureProvider<List<Subjects>>((ref) async {
  final service = ref.watch(SubjectServicesProv);
  return service.getSubject();
});

