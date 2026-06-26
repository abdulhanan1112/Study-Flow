import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/models/subject_model.dart';
import 'package:study_flow/providers/notes_provider.dart';
import 'package:dart_quill_delta/dart_quill_delta.dart';
import 'package:flutter_quill/flutter_quill.dart';
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
        ),
        body: listProvider.when(
            data: (Notes){
              return  Notes.isEmpty?Center(
                child: const Text('No Notes yet',style: TextStyle(fontSize: 25,fontWeight: FontWeight(60),color: Colors.black

                ),),
              ):GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:2,
                      mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.8
                  ),
                    itemCount: Notes.length,
                    itemBuilder: (context,index){
                      final delta=Delta.fromJson(Notes[index].notes);
                      final doc=Document.fromDelta(delta);
                      final plainText=doc.toPlainText();
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(20),
                          title:Text(Notes[index].title,style: TextStyle(fontSize: 25),),
                          subtitle:Column(
                            children: [
                              Text(
                                plainText.length < 20
                                    ? plainText
                                    : plainText.substring(0, 20) + '...',
                              ),
                              Row(
                                children: [
                                  // for time

                                  // open
                                  TextButton.icon(onPressed: (){
                                    Navigator.pushNamed(context, '/open_notes_screen',arguments: {
                                      'title' : Notes[index].title,
                                      'content' : plainText
                                    });
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
                              ),
                              TextButton.icon(onPressed: ()async {
                                final obj=ref.read(NotesProvider);
                                 obj.deleteNotes(Notes[index].notesId, sid);
                                 ref.invalidate(listOfNotesProvider);
                              },
                                icon: Icon(Icons.delete),
                                label:Text('delete'),
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
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/edit_notes_screen',arguments: sid);
      },child: Icon(Icons.add),),


    );
  }
}
