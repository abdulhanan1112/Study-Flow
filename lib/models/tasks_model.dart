import 'package:flutter/material.dart';

class TasksModel {
  final String title;
  final String description;
  final String deadline;
  final String taskId;
  final String subject;
  final int priority;// {1 means low priority , 2 means medium priority, 3 means high priority}
 TasksModel({required this.taskId,required this.priority,required this.deadline,required this.description,required this.title,required this.subject});
}