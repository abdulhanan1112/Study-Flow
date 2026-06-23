import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/providers/subject_provider.dart';
import 'package:study_flow/subjects/add_subjects_screen.dart';
class SubjectsScreen extends ConsumerWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final subjectListener=ref.watch(listOfSubjectProvider);
    return Scaffold(
     appBar: AppBar(
       title: Text('My Subjects',style: TextStyle(color: Colors.white,fontSize: 32.0),),
       backgroundColor: Colors.blue,
       leading: TextButton.icon(onPressed: (){
         Navigator.pop(context);
       }, label: Icon(Icons.arrow_back)
       ),
       actions: [
         FloatingActionButton(onPressed:(){
           showModalBottomSheet(context: context, builder: (context){
             return AddSubjectsScreen();
           });
         },
           child: Icon(Icons.add,color: Colors.white,),
           backgroundColor: Colors.indigoAccent,
)
       ],
     ),
      body:subjectListener.when(
          data: (subjects){
            return ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context,index){
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      title:Text(subjects[index].name,style: TextStyle(fontSize: 25),),
                      leading: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        width: 40.0,
                        height: 40.0,
                        child: Center(
                          child: Text(subjects[index].name.substring(0,1),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        ),
                      ),
                      trailing: IconButton(onPressed: (){
                        Navigator.pushNamed(context, '/notes_screen',arguments: subjects[index]);

                      }, icon: Icon(Icons.arrow_forward_ios,size: 20,)),
                      subtitle: Text('0 notes . 0 tasks'),
                    ),
                  );
                }
            );
          },
          error:(err,stack) {
            return Text(err.toString());
          },
          loading:() {
            return const Center(
            child: CircularProgressIndicator()
            );
          }
      )
    );
  }
}
