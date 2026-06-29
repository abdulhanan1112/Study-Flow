import 'package:flutter/material.dart';

class AboutDeveloperScreen extends StatelessWidget {
  const AboutDeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Developer"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.blue,
                child: const Text(
                  "MH",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Muhammad Hanan",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 6),

            const Center(
              child: Text(
                "Flutter Developer • Software Engineering Student",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "About Me",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Hello! I'm Muhammad Hanan, a Software Engineering student "
                  "with a passion for Flutter and Firebase development. "
                  "I enjoy creating clean, user-friendly, and practical mobile "
                  "applications that solve real-world problems.\n\n"
                  "StudyFlow is one of my personal projects, designed to help "
                  "students organize their subjects, notes, and daily tasks in "
                  "a simple and efficient way. My goal is to continuously learn "
                  "new technologies and become a skilled full-stack mobile developer.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Connect With Me",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(
                  Icons.code,
                  color: Colors.black,
                ),
                title: const Text("GitHub"),
                subtitle: const Text("abdulhanan1112"),
              ),
            ),

            const SizedBox(height: 10),

            Card(
              elevation: 2,
              child: ListTile(
                leading: const Icon(
                  Icons.work,
                  color: Colors.blue,
                ),
                title: const Text("LinkedIn"),
                subtitle: const Text(
                  "abdul-hannan-sattar-a777b0362",
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Divider(),

            const SizedBox(height: 10),

            const Center(
              child: Text(
                "Made with ❤️ using Flutter",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}