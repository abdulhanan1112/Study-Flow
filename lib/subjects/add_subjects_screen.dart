import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/providers/subject_provider.dart';
final subject=TextEditingController();
class AddSubjectsScreen extends ConsumerWidget {
  const AddSubjectsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
        padding:EdgeInsetsGeometry.all(20.0),
        child: Column(
          children: [
            Text('New Subject',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold),),
            SizedBox(height : 30.0),
            TextFormField(
              controller: subject,
              decoration: InputDecoration(
                hintText: 'Subject name',
                prefixIcon: Icon(Icons.note_add),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.blue,
                      width: 2
                  )
                )
              ),
            ),
            SizedBox(height : 30.0),
            Align( alignment: Alignment.centerLeft,child: Text('Preview',style: TextStyle(fontWeight: FontWeight(60),fontSize: 24),)),
            Card(
              elevation: 4,

              child: ListTile(

                  leading: Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text('S',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23,color: Colors.white),),
                    ),
              ),
                title: Text('Subject Name',style: TextStyle(fontSize: 25.0),),
                subtitle: Text('0 notes . 0 tasks'),
              
              ),
            ),
            SizedBox(height: 80,),
            SizedBox(
              width: 450,

              child: FloatingActionButton(
                  onPressed:()async{
                    final subjectObj=ref.read(SubjectServicesProv);
                     await subjectObj.addSubject(subject.text);
                     ref.invalidate(listOfSubjectProvider);
                     Navigator.pop(context);

                  },
                child: Text('Create Subject',style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 10,),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel'))
          ],
        )

    );
  }
}
