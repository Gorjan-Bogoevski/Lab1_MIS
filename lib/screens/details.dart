import 'package:flutter/material.dart';
import 'package:audi1/models/exam_class.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  String _formatDaysHours(Duration d) {
    final abs = d.isNegative ? d.abs() : d;
    final days = abs.inDays;
    final hours = abs.inHours % 24;
    return "$days дена, $hours часа";
  }

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    final now = DateTime.now();
    final diff = exam.date.difference(now);
    final isPast = diff.isNegative;

    final dateStr = "${exam.date.day}.${exam.date.month}.${exam.date.year}";
    final timeStr =
        "${exam.date.hour.toString().padLeft(2, '0')}:${exam.date.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.nameSubject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text("Предмет"),
              subtitle: Text(exam.nameSubject),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text("Датум"),
              subtitle: Text(dateStr),
            ),
            ListTile(
              leading: const Icon(Icons.access_time),
              title: const Text("Време"),
              subtitle: Text(timeStr),
            ),
            ListTile(
              leading: const Icon(Icons.meeting_room),
              title: const Text("Простории"),
              subtitle: Text(exam.labs.join(", ")),
            ),
            const Divider(),
            ListTile(
              leading: Icon(isPast ? Icons.history : Icons.hourglass_bottom),
              title: Text(isPast ? "Поминато време од испитот"
                  : "Преостанато време до испитот"),
              subtitle: Text(_formatDaysHours(diff)),
            ),
          ],
        ),
      ),
    );
  }
}