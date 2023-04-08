import 'dart:convert';

class Temp {
  final num day;
  Temp({
    required this.day,
  });

  Temp copyWith({
    num? day,
  }) {
    return Temp(
      day: day ?? this.day,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'day': day,
    };
  }

  factory Temp.fromMap(Map<String, dynamic> map) {
    return Temp(
      day: map['day'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Temp.fromJson(String source) =>
      Temp.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Temp(day: $day)';

  @override
  bool operator ==(covariant Temp other) {
    if (identical(this, other)) return true;

    return other.day == day;
  }

  @override
  int get hashCode => day.hashCode;
}
