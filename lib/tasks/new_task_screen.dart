import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/providers/subject_provider.dart';
import'package:study_flow/models/subject_model.dart';
import 'package:study_flow/providers/tasks_provider.dart';

class NewTaskScreen extends ConsumerStatefulWidget {
  final String? sId;
  const NewTaskScreen({super.key,this.sId});

  @override
  ConsumerState<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends ConsumerState<NewTaskScreen> {
  final title = TextEditingController();
  final description = TextEditingController();
  DateTime? deadline;
  Subjects? selectedSubject;
  @override
  Widget build(BuildContext context) {

    final totalSubjects=ref.watch(listOfSubjectProvider);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text('New Task', style: TextStyle(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
          body: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height:20.0),
                          TextFormField(
                            controller: title,
                            decoration: InputDecoration(
                                hintText: 'Task title',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)
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
                          SizedBox(height:20.0),
                          TextFormField(
                            maxLines: 5,
                            controller: description,
                            decoration: InputDecoration(
                                hintText: 'Description',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12)
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
                          SizedBox(height:20.0),

                          GestureDetector(
                            onTap: () async {
                              final DateTime? date = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2030),
                                  currentDate: DateTime.now());
                              if(date!=null)
                              {
                                setState
                              (() {
                                deadline = date;
                              });
                            }
                              },
                            child: SizedBox(
                              width: 400,
                              height: 60,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(

                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.date_range),
                                      SizedBox(width: 20,),
                                      Text(deadline==null?'Select deadline':deadline!.toString().split(' ')[0],style: TextStyle(fontSize: 20),)
                                    ],
                                  )
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerLeft,
                              child: Text('Choose the subject', style: TextStyle(color: Colors.black,fontSize: 20),)),
                          SizedBox(height: 10,),
                          totalSubjects.when(data: (subjects){
                            return Container(
                                margin: const EdgeInsets.symmetric(horizontal: 12),
                                padding: const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12)),
                                 child: DropdownButtonFormField<Subjects>(
                                   hint: Text('Subjects i.e Mathematics'),
                                value: selectedSubject,
                                items: subjects.map((subject) {
                                  return DropdownMenuItem<Subjects>(
                                    value: subject,
                                    child: Text(subject.name),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedSubject = value;
                                  });
                                },
                              ),

                            );
                          }, error:(err,stack){
                            return Text(err.toString());
                          }, loading: (){
                            return CircularProgressIndicator();
                          }),
                          SizedBox(
                            height: 200,
                          ),



                        ],
                      ),
                    )
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: FloatingActionButton(onPressed:(){
                          Navigator.pop(context);
                        },

                          child: Text('Cancel'), backgroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: FloatingActionButton(onPressed:()async{
                          final obj=ref.read(taskProvider);
                          final sid=widget.sId?? selectedSubject!.sid;
                          await obj.addTasks(sid, description.text,title.text, selectedSubject!.name, deadline!);
                          ref.invalidate(totalTasksProvider);
                          Navigator.pop(context);
                        },
                          child: Text('Add Task',style: TextStyle(color: Colors.white),), backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}
