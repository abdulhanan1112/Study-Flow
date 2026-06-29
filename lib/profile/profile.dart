import 'package:flutter/material.dart';
import 'package:study_flow/profile/about_developer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}
bool notificationFlag=true;
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('StudyFlow',style: TextStyle(color: Colors.blue,fontSize: 29),),
          centerTitle: true,
          backgroundColor: Colors.white,
      
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                
                  width: 400,
                  height: 350,
                  child: Column(
                    children: [
                      SizedBox(height: 30,),
                      CircleAvatar(
                        child: Text('MH',style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),),
                        backgroundColor: Colors.blue,
                        radius: 60,
                      ),
                      TextButton(onPressed:(){}, child:Text('Edit')),
                      Text('Muhammad Hanan',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),
                      SizedBox(height: 10,),
                      Text('hanansattar533@gmail.com',style: TextStyle(fontWeight: FontWeight(100)),),
                      SizedBox(height: 10,),
                      Text('Member since June 2026',style: TextStyle(fontWeight: FontWeight(100)),),
                
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                
                  width: 400,
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Icon(Icons.menu_book,color: Colors.red,),
                            SizedBox(height: 10,),
                            Text('4',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
                            Text('SUBJECTS',style: TextStyle(fontWeight: FontWeight(100)),)
                          ],
                        ),
                        SizedBox(width: 20,),
                        VerticalDivider(
                          width: 20,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 30,),
                
                        Column(
                          children: [
                            Icon(Icons.edit,color: Colors.yellow,),
                            SizedBox(height: 10,),
                            Text('38',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
                            Text('NOTES',style: TextStyle(fontWeight: FontWeight(100)),)
                          ],
                        ),
                        SizedBox(width: 30,),
                        VerticalDivider(
                          width: 20,
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 20,),
                
                        Column(
                          children: [
                            Icon(Icons.task,color: Colors.purple,),
                            SizedBox(height: 10,),
                            Text('12',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),),
                            Text('TASKS',style: TextStyle(fontWeight: FontWeight(100)),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('    Settings',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),)
                ),
                Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.notification_important,color: Colors.purple,),
                        title: Text('Notification'),
                        trailing: Switch(activeColor: Colors.indigoAccent,value: notificationFlag, onChanged:(value){
                          setState(() {
                            notificationFlag=!notificationFlag;
                          });
                        }),
                      ),
                      Divider(
                        thickness: 2,
                        height: 20,
                      ),
                      ListTile(
                        leading: Icon(Icons.dark_mode,color: Colors.black,),
                        title: Text('Dark Mode'),
                        trailing: Switch(
                            activeColor: Colors.indigoAccent,
                            value: notificationFlag, onChanged:(value){
                          setState(() {
                            notificationFlag=!notificationFlag;
                          });
                        }),
                      ),
                      Divider(
                        thickness: 2,
                        height: 20,
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outline),
                        title: Text('About developer'),
                        trailing: IconButton(onPressed:(){
                          Navigator.pushNamed(context, '/about_developer');
                        }, icon: Icon(Icons.arrow_forward_ios))
                      ),Divider(
                        thickness: 2,
                        height: 20,
                      ),
                      ListTile(
                        title: TextButton.icon(onPressed:(){}, icon:Icon(Icons.logout,color: Colors.redAccent,),label: Text('Sign Out',style: TextStyle(color: Colors.redAccent),),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 12),

                  width: 400,
                  height: 150,
                  child: Center(
                    child: Text('Stay focused, achieve more.',style: TextStyle(color: Colors.black,fontSize: 24),),
                  ),

                )
                
                
                
                
                
                
                
                
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
