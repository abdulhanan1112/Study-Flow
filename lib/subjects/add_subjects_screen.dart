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
            Text('New Subject',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            SizedBox(height : 20.0),
            TextFormField(
              controller: subject,
              decoration: InputDecoration(
                hintText: 'Subject name',
                prefixIcon: Icon(Icons.note_add)
              ),
            ),
            SizedBox(height : 20.0),
            Text('PREVIEW',style: TextStyle(fontWeight: FontWeight(20)),),
            ListTile(
                leading: Container(
                  width: 20.0,
                  height: 20.0,
                  color: Colors.blue,
                  child: Center(
                    child: Text('S',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                  ),
            ),
              title: Text('Subject Name',style: TextStyle(fontSize: 25.0),),
              subtitle: Text('0 notes . 0 tasks'),

            ),
            SizedBox(height: 80,),
            SizedBox(
              width: 150,

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
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('Cancel'))
          ],
        )

    );
  }
}
