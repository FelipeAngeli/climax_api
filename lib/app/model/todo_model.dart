class TodoModel {
  final String day;
  final String temperature;
  final String wind;

  TodoModel({
    required this.day,
    required this.temperature,
    required this.wind,
  });

  static TodoModel fromJson(Map map) {
    return TodoModel(
      day: map["day"],
      temperature: map["temperature"],
      wind: map["wind"],
    );
  }

  //teste controller

  static TodoModel stub() => TodoModel(
        day: "day",
        temperature: "temperature",
        wind: "wind",
      );
}
