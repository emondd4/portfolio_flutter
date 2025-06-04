import 'package:flutter/material.dart';

import 'DashedLinePainter.dart';

class TimelineItem extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final Color dotColor;
  final bool isLast;

  const TimelineItem({
    required this.date,
    required this.title,
    required this.description,
    required this.dotColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left side: Date and Title
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
        SizedBox(width: 16),
        // Center: Dot and Line
        Column(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: dotColor,
            ),
            if (!isLast)
              CustomPaint(
                size: Size(2, 120),
                painter: DashedLinePainter(),
              ),
          ],
        ),
        SizedBox(width: 16),
        // Right side: Description
        Expanded(
          flex: 4,
          child: Text(
            description,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}