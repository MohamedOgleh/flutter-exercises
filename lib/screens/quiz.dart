import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/models/Questions.dart';
import 'package:untitled/widget/button.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<Question> questions = [
    Question("What is the capital city of Somaliland",
        ["Borama", "Burco", "Ceergabo", "Hargeisa"], "Hargeisa"),
    Question("Wich city is the largest Somali city",
        ["Hargeisa", "Jigjiga", "Muqdisho", "Burco"], "Muqdisho"),
    Question("What is 1+5", ["6", "9", "20", "8"], "6"),
  ];

  int index = 0;

  Widget showResult() {
    var color = Colors.yellow;
    String grade = 'Your score is normal';
    if (Question.correct > Question.wrong) {
      color = Colors.green;
      grade = 'Congratulations your grade is height';
    } else {
      color = Colors.red;
      grade = 'Sorry you failed';
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2, color: color),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Corrected: ${Question.correct} Wrong: ${Question.wrong}",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          grade,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }

  Widget showQuestions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Question ${index + 1} :${questions[index].question}",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        ...questions[index].answers.map(
              (question) => ButtonWidget(
                title: question,
                onTap: () => getAnswer(question, questions[index]),
              ),
            ),
      ],
    );
  }

  void getAnswer(String answer, Question question) {
    print(
        'The correct ansewr is ${question.correctAnswer} in ${question.question}');

    if (index < questions.length) {
      if (answer == question.correctAnswer) {
        Question.correct++;
      } else {
        Question.wrong++;
      }
      index++;
      setState(() {});
    } else {
      print('Corrected ${Question.correct} Wrong  ${Question.wrong}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Quiz'),
      ),
      body: Center(
        child: index < questions.length
            ? showQuestions()
            : showResult(),
      ),
    );
  }
}
