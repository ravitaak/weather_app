// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather(
    this.id,
    this.main,
    this.description,
    this.icon,
  );

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id ?? this.id,
      main ?? this.main,
      description ?? this.description,
      icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      map['id'] as int,
      map['main'] as String,
      map['description'] as String,
      map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Weather(id: $id, main: $main, description: $description, icon: $icon)';
  }

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return id.hashCode ^ main.hashCode ^ description.hashCode ^ icon.hashCode;
  }
}
