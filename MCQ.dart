import 'dart:io';
import 'dart:math';

class Question {
  String question;
  List<String> options;
  int correctOption;

  Question(this.question, this.options, this.correctOption);
}

void main() {
  List<Question> questions = [
    Question('What is the capital of France?', ['Berlin', 'London', 'Paris', 'Rome'], 2),
    Question('Who wrote "Hamlet"?', ['Charles Dickens', 'William Shakespeare', 'J.K. Rowling', 'Mark Twain'], 1),
    Question('What is the largest planet in our Solar System?', ['Earth', 'Mars', 'Jupiter', 'Saturn'], 2),
    Question('Who painted the Mona Lisa?', ['Vincent Van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'], 2),
    Question('What is the chemical symbol for water?', ['O2', 'H2O', 'CO2', 'NaCl'], 1)
  ];

  int score = 0;
  int totalQuestions = questions.length;
  var random = Random();
  
  print('Welcome to the Quiz! Answer the following questions:');
  
  for (int i = 0; i < totalQuestions; i++) {
    int questionIndex = random.nextInt(questions.length);
    Question currentQuestion = questions[questionIndex];
    questions.removeAt(questionIndex); // Remove the asked question to avoid repetition
    
    print('\nQuestion ${i + 1}: ${currentQuestion.question}');
    for (int j = 0; j < currentQuestion.options.length; j++) {
      print('${j + 1}. ${currentQuestion.options[j]}');
    }

    stdout.write('Your answer (1-${currentQuestion.options.length}): ');
    int? answer = int.tryParse(stdin.readLineSync()!);
    
    if (answer != null && answer - 1 == currentQuestion.correctOption) {
      print('Correct!');
      score++;
    } else {
      print('Incorrect! The correct answer is ${currentQuestion.correctOption + 1}. ${currentQuestion.options[currentQuestion.correctOption]}');
    }
  }
  
  print('\nYou have completed the quiz!');
  print('Your score is $score out of $totalQuestions.');
}

