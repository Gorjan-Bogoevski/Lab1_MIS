import 'package:audi1/models/exam_class.dart';
import 'package:audi1/widgets/ExamList.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Exam> exams;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();

    exams = [
      Exam(1, "MIS", now.subtract(const Duration(days: 3)),
          ["Lab 186", "Lab 138", "Lab 12"]),
      Exam(2, "NLP", now.subtract(const Duration(days: 1)), ["Lab 186"]),
      Exam(3, "RNMP", now, ["Lab 1", "Lab 2"]),
      Exam(4, "VP", now.add(const Duration(days: 1)),
          ["Lab 1", "Lab 2", "Lab 3"]),
      Exam(5, "VBS", now.add(const Duration(days: 2)), ["Lab 12"]),
      Exam(6, "SKIT", now.add(const Duration(days: 3)),
          ["Lab 186", "Lab 1", "Lab 12", "Lab 13"]),
      Exam(7, "OOP", now.add(const Duration(days: 5)), ["Lab 138", "Lab 12"]),
      Exam(8, "SP", now.add(const Duration(days: 7)), ["Lab 15"]),
      Exam(9, "VVKN", now.subtract(const Duration(days: 5)),
          ["Lab 8", "Lab 138", "Lab 12", "Lab 15"]),
      Exam(10, "VNP", now.add(const Duration(days: 10)),
          ["Lab 8", "Lab 9", "Lab 12"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Распоред за испити - 221193"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Examlist(exams),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Text(
              "Вкупен број на испити: ${exams.length}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Color.fromARGB(
                  255, 255, 152, 0) ,),
            ),
          ),
          ),
        ],
      ),
    );
  }
}