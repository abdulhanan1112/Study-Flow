import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_flow/models/notes_model.dart';


class NotesService {
  final String uid;

  NotesService({required this.uid});

  //  instance of collection
  final CollectionReference _subjectInstance= FirebaseFirestore.instance.collection('Users');

  // add notes for specific subject
  Future<void> addNotes(String subjectId,List<Map> notes,String title)async{
    try{
      await _subjectInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Notes').add(
        {
          'title':title,
          'content' :notes
        }
      );
    }catch(e)
    {
      print(e.toString());
    }
  }

  // get list of notes
  Future<List<NotesModel>> getNotes(String subjectId)async{
    final notes= await _subjectInstance.doc(uid).collection('Subjects').doc(subjectId).collection('Notes').get();
    return notes.docs.map((note){
      return NotesModel(notes: note['content'],title: note['title']);
    }).toList();
  }

}