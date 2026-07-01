import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_flow/home/home_screen.dart';
import 'package:study_flow/notes/edit_notes_screen.dart';
import 'package:study_flow/profile/profile.dart';
import 'package:study_flow/providers/navigation_provider.dart';
import 'package:study_flow/subjects/subjects_screen.dart';
import 'package:study_flow/tasks/new_task_screen.dart';
import 'package:study_flow/tasks/task_screen.dart';

class Dashboard extends ConsumerWidget {
  Dashboard({super.key});
  final screen=[
    HomeScreen(),
    SubjectsScreen(),
    TaskScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index=ref.watch(NavigatorProvider);
    return Scaffold(
      body: IndexedStack(
        index: index,
        children:screen
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
          onDestinationSelected: (value){
          ref.read(NavigatorProvider.notifier).state=value;
          },
          destinations:const [
            NavigationDestination(
                icon:Icon(Icons.home),
                label: 'home',
                selectedIcon: Icon(Icons.home_outlined),

            ),
            NavigationDestination(
              icon:Icon(Icons.menu_book),
              label: 'subjects',
              selectedIcon: Icon(Icons.menu_book_outlined),

            ),NavigationDestination(
              icon:Icon(Icons.task),
              label: 'tasks',
              selectedIcon: Icon(Icons.task_outlined),

            ),NavigationDestination(
              icon:Icon(Icons.person),
              label: 'profile',
              selectedIcon: Icon(Icons.person_outlined),

            ),
          ]

      ),
    );
  }
}
