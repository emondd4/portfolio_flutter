import 'package:flutter/material.dart';

import 'TimelineItem.dart';

class JobTimeLine extends StatelessWidget {
  const JobTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimelineItem(
          date: "MAR 2021 - PRESENT",
          title: "AQUALINK BANGLADESH LTD.",
          description:
          "FLUTTER DEVELOPER\nDelivering clean, maintainable, and optimized code, Ensuring pixel-perfect UI across platforms, Shipping production-grade applications with modern tech, Collaborating with teams to bring innovative ideas to life",
          dotColor: Colors.teal,
        ),
        const SizedBox(height: 10.0,),
        TimelineItem(
          date: "AUG 2020 - MAR 2021",
          title: "BDTASK",
          description:
          "KOTLIN DEVELOPER\nImplementing MVVM architecture for clean code separation, Integrating REST APIs and local databases (Room, SQLite), Ensuring performance, scalability, and security best practices",
          dotColor: Colors.yellow,
          isLast: false,
        ),
      ],
    );
  }
}