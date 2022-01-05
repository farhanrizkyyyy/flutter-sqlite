class Task {
  final int taskId;
  final String taskName;
  final String description;
  final String createdBy;
  final String dueDate;
  final String isDone;

  Task({
    required this.taskId,
    required this.taskName,
    required this.description,
    required this.createdBy,
    required this.dueDate,
    required this.isDone,
  });

  Map<String, dynamic> toMap() => {
        'taskId': taskId,
        'taskName': taskName,
        'description': description,
        'createdBy': createdBy,
        'dueDate': dueDate,
        'isDone': isDone,
      };
}
