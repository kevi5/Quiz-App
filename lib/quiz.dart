class Quiz {
  List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Madrid', 'Rome'],
      'correct_answer': 'Paris',
    },
    {
      'question': 'What is the currency of Japan?',
      'answers': ['Yen', 'Dollar', 'Euro', 'Pound'],
      'correct_answer': 'Yen',
    },
    {
      'question': 'Who is the author of "The Great Gatsby"?',
      'answers': ['Ernest Hemingway', 'F. Scott Fitzgerald', 'William Faulkner', 'John Steinbeck'],
      'correct_answer': 'F. Scott Fitzgerald',
    },
  ];

  List<Map<String, dynamic>> get questions => _questions;
}
