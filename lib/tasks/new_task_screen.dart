import 'package:flutter/material.dart';
final task=TextEditingController();
final description=TextEditingController();
DateTime? deadline=DateTime.now();
class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task',style: TextStyle(color: Colors.black,fontSize: 28,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration:InputDecoration(
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
            ), SizedBox(
              height: 200,
              child: TextFormField(
                decoration:InputDecoration(
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
            ),
            GestureDetector(
              onTap: ()async {
               final DateTime? date=await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030),currentDate: DateTime.now());
                deadline=date;
              },
              child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:Text('Select Deadline')
                ),
              ),
          ],
        ),
      ),
    );
  }
}
