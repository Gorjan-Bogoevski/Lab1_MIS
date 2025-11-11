import 'package:flutter/material.dart';
import 'package:audi1/models/exam_class.dart';

class Examcart extends StatelessWidget {
  final Exam exam;
  const Examcart(this.exam, {super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.date.isBefore(now);

    final bg = isPast ? Colors.orange[100] : Colors.orange;
    final dateStr = "${exam.date.day}.${exam.date.month}.${exam.date.year}";
    final timeStr =
        "${exam.date.hour.toString().padLeft(2, '0')}:${exam.date.minute.toString().padLeft(2, '0')}";

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/details", arguments: exam);
      },
      child: Card(
        color: bg,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(exam.nameSubject,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Row(children: [
                const Icon(Icons.date_range, size: 18),
                const SizedBox(width: 6),
                Text("Датум: $dateStr"),
              ]),
              Row(children: [
                const Icon(Icons.access_time, size: 18),
                const SizedBox(width: 6),
                Text("Време: $timeStr"),
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Icon(Icons.meeting_room, size: 18),
                const SizedBox(width: 6),
                Expanded(child: Text("Простории: ${exam.labs.join(', ')}")),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}