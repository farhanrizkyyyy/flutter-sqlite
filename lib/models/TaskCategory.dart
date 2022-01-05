class TaskCategory {
  final int categoryId;
  final String username;
  final String categoryName;
  final bool isDone;

  TaskCategory({
    required this.categoryId,
    required this.username,
    required this.categoryName,
    required this.isDone,
  });

  Map<String, dynamic> toMap() => {
        'categoryId': categoryId,
        'username': username,
        'categoryName': categoryName,
        'isDone': isDone,
      };
}
