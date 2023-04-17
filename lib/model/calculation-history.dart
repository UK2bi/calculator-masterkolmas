class CalculationHistory {
  String? id;
  String calculation;
  String title;
  String time;

  CalculationHistory({
    this.id,
    required this.calculation,
    required this.title,
    required this.time,
  });

  // ...

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'calculation': calculation,
      'title': title,
      'time': time,
    };
  }

  factory CalculationHistory.fromMap(Map<String, dynamic> map) {
    return CalculationHistory(
      id: map['id'],
      calculation: map['calculation'],
      title: map['title'],
      time: map['time'],
    );
  }
}