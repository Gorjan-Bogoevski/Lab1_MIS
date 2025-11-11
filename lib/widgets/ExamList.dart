import 'package:audi1/models/exam_class.dart';
import 'package:audi1/widgets/ExamCart.dart';
import 'package:flutter/material.dart';

class Examlist extends StatelessWidget {
  final List<Exam> exams;

  const Examlist(this.exams, {super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.date.compareTo(b.date));

    return ListView.builder(
      itemCount: exams.length,
      itemBuilder: (context, index) {
        final exam = exams[index];
        return Examcart(exam);
      },
    );
  }
}