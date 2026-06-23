import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_flow/models/subject_model.dart';

class SubjectService {
  String? uid;
  int count=0;
  SubjectService( {this.uid});

  //  instance of collection
  final CollectionReference _subjectInstance= FirebaseFirestore.instance.collection('Users');

  //function to add Subjects
  Future<void> addSubject(String SubjectName) async{
    try{
      await _subjectInstance.doc(uid).collection('Subjects').add({
        'name': SubjectName,
      });
      count++;
      
    }catch(e){

      print('Data not saved');

    }
  }

  //get all Subjects of user
  Future<List<Subjects>> getSubject()async{

    final QuerySnapshot<Map<String, dynamic>> subjects=await _subjectInstance.doc(uid).collection('Subjects').get();
    return subjects.docs.map((doc) {
      return Subjects(name: doc['name'],sid: doc.id);
    }).toList();



  }




}