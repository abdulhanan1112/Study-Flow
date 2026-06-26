import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/models/notes_model.dart';
import 'package:study_flow/services/notes_service.dart';


// Provider for add notes
final NotesProvider=Provider((ref){
  final user=FirebaseAuth.instance.currentUser;
  return NotesService(uid: user!.uid);
});

// future Provider for list of notes
final listOfNotesProvider=FutureProvider.family<List<NotesModel>,String>((ref,subjectId)
{
  final notes=ref.watch(NotesProvider);
  return notes.getNotes(subjectId);
});


    