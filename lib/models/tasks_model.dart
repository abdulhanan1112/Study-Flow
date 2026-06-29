import 'package:flutter/material.dart';

class TasksModel {
  final String title;
  final String description;
  final DateTime deadline;
  final String taskId;
  final String subject;
 TasksModel({required this.taskId,required this.deadline,required this.description,required this.title,required this.subject});
}