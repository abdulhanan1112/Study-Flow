import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(                           //column of dashboard
            children: [
              Row(
                children: [
                  Text(
                    'Hello, Hanan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.waving_hand, color: Colors.yellow),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: Text('MH', style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.blueAccent,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Image.asset('assets/studyflow_logo.png'),
                  Text(
                    'StudyFlow',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 28),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(                           //Subject Container
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.subject, color: Colors.blueAccent),
                        Text('5',style: TextStyle(color: Colors.black),),
                        Text('SUBJECTS',style: TextStyle(color: Colors.lightBlue),)
                      ],
                    ),
                  ),
                  SizedBox(width: 20,),
                  Container(                           //Notes Container
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.note_add_sharp, color: Colors.lightGreen),
                        Text('12',style: TextStyle(color: Colors.black),),
                        Text('NOTES',style: TextStyle(color: Colors.green),)
                      ],
                    ),
                  ),
                  SizedBox(width: 10,), Container(                           //Task Container
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.task_alt, color: Colors.orange),
                        Text('3',style: TextStyle(color: Colors.black),),
                        Text('TASKS',style: TextStyle(color: Colors.orange),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Row(                                              // My Subjects and see all
                children: [
                  Text('My Subjects',style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
                  SizedBox(width: 40,),
                  TextButton(onPressed:(){}, child:Text('See All')),
          
                ],
              ),
              SizedBox(height: 10,),
              Column(                                                        //Subjects show
                children: [
                  Row(                                                 //Row of subjects
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text('Sociology'),
                          subtitle: Text('24 Notes . 2 Tasks'),
                        ),
          
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text('Biology'),
                          subtitle: Text('24 Notes . 2 Tasks'),
                        ),
          
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(                                                            //Row of subjects
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text('Literature'),
                          subtitle: Text('24 Notes . 2 Tasks'),
                        ),
          
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          title: Text('Calculus'),
                          subtitle: Text('24 Notes . 2 Tasks'),
                        ),
          
                      )
                    ],
                  ),
                ],
              ),
              Text('Recent Notes',style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.bold),),
              Card(                                                             //Card of notes
                margin: EdgeInsets.all(8),
                child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    title:Text('Cell Membrane',style: TextStyle(fontSize: 25),),
                    subtitle:Column(
                      children: [
                        Text(
                            'gfkhgfnvasmbahd mhhgjag dhgvsjf hhgfjahgc'
                        ),
                        Text('BIOLOGY',style: TextStyle(color: Colors.green),),
          
                      ],
                    )
          
                ),
          
          
              ),
              Card(                                                             //Card of notes
                margin: EdgeInsets.all(8),
                child: ListTile(
                    contentPadding: EdgeInsets.all(20),
                    title:Text('Cell Membrane',style: TextStyle(fontSize: 25),),
                    subtitle:Column(
                      children: [
                        Text(
                            'gfkhgfnvasmbahd mhhgjag dhgvsjf hhgfjahgc'
                        ),
                        Text('BIOLOGY',style: TextStyle(color: Colors.green),),
          
                      ],
                    )
          
                ),
          
          
              ),
          
            ],
          ),
        ),
      
      ),
    );
  }
}
