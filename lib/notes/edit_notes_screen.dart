import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/providers/notes_provider.dart';
final title=TextEditingController();
final notes=QuillController.basic();
class EditNotesScreen extends ConsumerWidget {
  const EditNotesScreen({super.key});
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final String sId=ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: TextButton.icon(onPressed: (){
            Navigator.pop(context);
          }, label: Icon(Icons.arrow_back)
          ),
            title: TextFormField(
              controller: title,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                          color: Colors.blue,
                          width: 2
      
                      )
                  )
              ),
      
            ),
            actions: [
      
              TextButton(onPressed: ()async {
                final notesProv=ref.read(NotesProvider);
                await notesProv.addNotes(sId, notes.document.toDelta().toJson(), title.text);
                ref.invalidate(listOfNotesProvider);
                Navigator.pop(context);
      
              }, child: Icon(Icons.check_circle,color: Colors.blue,size: 30,))
      
          ],
        ),
        body: Column(
          children: [
            QuillSimpleToolbar(
                controller: notes,
      
            ),
            Expanded(
      
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: QuillEditor.basic(
                  controller: notes,
      
                            ),
                )
            )
          ],
        ),
      
      ),
    );
  }
}
