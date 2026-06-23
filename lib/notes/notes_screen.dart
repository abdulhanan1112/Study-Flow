import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/models/subject_model.dart';
import 'package:study_flow/notes/edit_notes_screen.dart';
import 'package:study_flow/providers/notes_provider.dart';

class NotesScreen extends ConsumerWidget {
   NotesScreen({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final subject=ModalRoute.of(context)!.settings.arguments as Subjects;
    final String sid=subject.sid;
    final String name=subject.name;
    final listProvider=ref.watch(listOfNotesProvider(sid));
    return Scaffold(
        appBar: AppBar(
          title: Text(name,style: TextStyle(color: Colors.white,fontSize: 32.0),),
          backgroundColor: Colors.blue,
          leading: TextButton.icon(onPressed: (){
            Navigator.pop(context);
          }, label: Icon(Icons.arrow_back)
          ),
          actions: [
            FloatingActionButton(onPressed:(){
              Navigator.pushNamed(context, '/edit_notes_screen',arguments: sid);

            },
              child: Icon(Icons.add,color: Colors.white,),
              backgroundColor: Colors.indigoAccent,
            )
          ],
        ),
        body:Column(
            children: <Widget>[
              listProvider.when(
            data: (Notes){
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:2,
                    mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.8
                ),
                  itemCount: Notes.length,
                  itemBuilder: (context,index){
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(20),
                        title:Text(Notes[index].title,style: TextStyle(fontSize: 25),),
                        subtitle:Column(
                          children: [
                            Text(Notes[index].notes.substring(0,30)+'...'),
                            // for time

                            // open
                            TextButton.icon(onPressed: (){
                              Navigator.pushNamed(context, '/open_notes_screen');
                            },
                              icon: Icon(Icons.remove_red_eye),
                                label:Text('open'),
                            ),

                            // edit
                            TextButton.icon(onPressed: (){
                              Navigator.pushNamed(context, '/edit_notes_screen',arguments: sid);
                            },
                              icon: Icon(Icons.edit),
                              label:Text('edit'),
                            ),
                          ],
                        )

                      ),
                    );
                  },
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
        ),
         Align(
           alignment: Alignment.centerRight,
             child: IconButton(onPressed: (){
               Navigator.pushNamed(context, '/edit_notes_screen',arguments: sid);
             }, icon:Icon(Icons.add_circle,color: Colors.blue,)))
       ]
        )
    );
  }
}
