import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/providers/tasks_provider.dart';
import 'package:study_flow/tasks/new_task_screen.dart';

class TaskScreen extends ConsumerWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final taskListener=ref.watch(totalTasksProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text('Your Tasks',style: TextStyle(color: Colors.white,fontSize: 28),),
          centerTitle: true,
        backgroundColor:Colors.blue,
        ),
        body:taskListener.when(
            data: (tasks){
              return tasks.isEmpty?Center(

                child: const Text('No Tasks added yet',style: TextStyle(fontSize: 25,fontWeight: FontWeight(60),color: Colors.black)),

              ):ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context,index){
                    return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      child: Padding(
                          padding:EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.assignment),
                                SizedBox(width: 10,),
                                Align(
                                    alignment: Alignment.centerLeft,
                                        child: Text(tasks[index].title,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black),
                                         )
                                ),
                                
                                
                                
                              ],
                            ),
                            Row(
                              children: [
                                Text('Duedate : '),
                                Icon(Icons.calendar_month,color: Colors.red,),
                                Text(tasks[index].deadline.toString().split(' ')[0],style: TextStyle(
                                  color: Colors.red,fontSize: 18
                                ),),
                                SizedBox(width: 150,),
                                CircleAvatar(
                                  radius: 2*tasks[index].subject.length+6,
                                  backgroundColor: Colors.redAccent,
                                  child: Text(tasks[index].subject,style: TextStyle(fontSize: 9,color: Colors.black),),
                                )
                              ],
                            )


                          ],
                        ),
                      )
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
        ),
        floatingActionButton: FloatingActionButton(onPressed:(){
          showModalBottomSheet(context: context, builder:(context){
            return NewTaskScreen();
          });
        },child:Icon(Icons.add),),

      ),
    );
  }
}
