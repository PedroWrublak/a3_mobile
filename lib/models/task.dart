class Task {
  int id;
  String title;
  String description;
  bool completed;
  String category;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.completed = false,
    required this.category,
  });
}
