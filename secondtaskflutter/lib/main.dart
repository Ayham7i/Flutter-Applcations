import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: MyHomePage(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),
      debugShowCheckedModeBanner: false,  // Remove the debug banner
    );
  }
}

class MyHomePage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  MyHomePage({required this.toggleTheme, required this.isDarkMode});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    QuizScreen(),
    PlaceholderWidget("Results"),
    SettingsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: widget.toggleTheme,
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Navigation'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Quiz'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Results'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Welcome to the Quiz App!'),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<int> _selectedAnswers = [];

  final List<Question> _questions = [
    Question(
      questionText: 'What is the capital of France?',
      answers: ['Berlin', 'Madrid', 'Paris', 'Rome'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is 2 + 2?',
      answers: ['3', '4', '5', '6'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'Who wrote "To Kill a Mockingbird"?',
      answers: ['Harper Lee', 'Mark Twain', 'Ernest Hemingway', 'F. Scott Fitzgerald'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the largest planet in our solar system?',
      answers: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the chemical symbol for gold?',
      answers: ['Au', 'Ag', 'Pb', 'Fe'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Who painted the Mona Lisa?',
      answers: ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Which element has the atomic number 1?',
      answers: ['Helium', 'Oxygen', 'Hydrogen', 'Carbon'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the square root of 64?',
      answers: ['6', '7', '8', '9'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Who is known as the "Father of Computers"?',
      answers: ['Alan Turing', 'Charles Babbage', 'Thomas Edison', 'Nikola Tesla'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What year did the Titanic sink?',
      answers: ['1912', '1913', '1914', '1915'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the powerhouse of the cell?',
      answers: ['Nucleus', 'Ribosome', 'Mitochondria', 'Chloroplast'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the capital of Japan?',
      answers: ['Beijing', 'Seoul', 'Bangkok', 'Tokyo'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Which planet is known as the Red Planet?',
      answers: ['Earth', 'Mars', 'Jupiter', 'Saturn'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the hardest natural substance on Earth?',
      answers: ['Gold', 'Iron', 'Diamond', 'Silver'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'Who developed the theory of relativity?',
      answers: ['Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Nikola Tesla'],
      correctAnswerIndex: 1,
    ),
    Question(
      questionText: 'What is the capital of Canada?',
      answers: ['Toronto', 'Vancouver', 'Ottawa', 'Montreal'],
      correctAnswerIndex: 2,
    ),
    Question(
      questionText: 'What is the speed of light?',
      answers: ['299,792,458 meters per second', '150,000,000 meters per second', '30,000,000 meters per second', '300,000,000 meters per second'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'Which organ is responsible for pumping blood?',
      answers: ['Lungs', 'Brain', 'Liver', 'Heart'],
      correctAnswerIndex: 3,
    ),
    Question(
      questionText: 'Who wrote "1984"?',
      answers: ['George Orwell', 'Aldous Huxley', 'Ray Bradbury', 'Philip K. Dick'],
      correctAnswerIndex: 0,
    ),
    Question(
      questionText: 'What is the chemical symbol for water?',
      answers: ['H2O', 'O2', 'CO2', 'H2'],
      correctAnswerIndex: 0,
    ),
  ];

  void _nextQuestion(int selectedAnswer) {
    setState(() {
      _selectedAnswers.add(selectedAnswer);
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsScreen(
              answers: _selectedAnswers,
              questions: _questions,
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            question.questionText,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10.0, // space between buttons
            alignment: WrapAlignment.center,
            children: question.answers.asMap().entries.map((entry) {
              int idx = entry.key;
              String answer = entry.value;
              return ElevatedButton(
                onPressed: () => _nextQuestion(idx),
                child: Text(answer),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class ResultsScreen extends StatelessWidget {
  final List<int> answers;
  final List<Question> questions;

  ResultsScreen({required this.answers, required this.questions});

  @override
  Widget build(BuildContext context) {
    int score = 0;
    for (int i = 0; i < questions.length; i++) {
            if (answers[i] == questions[i].correctAnswerIndex) {
        score++;
      }
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Your Score: $score / ${questions.length}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Back to Home'),
          ),
        ],
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswerIndex,
  });
}

class PlaceholderWidget extends StatelessWidget {
  final String text;
  PlaceholderWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

