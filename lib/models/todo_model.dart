class User {
  final String id;
  final String name;
  final String task;

  const User({
    required this.id,
    required this.name,
    required this.task,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "task": task,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      task: json["task"],
      name: json["name"],
    );
  }
}
