// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:weather_app/scr/models/weathers/weather.dart';

class Hourly {
  final int dt;
  final num temp;
  final Weather weather;
  Hourly({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  Hourly copyWith({
    int? dt,
    num? temp,
    Weather? weather,
  }) {
    return Hourly(
      dt: dt ?? this.dt,
      temp: temp ?? this.temp,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'temp': temp,
      'weather': weather.toMap(),
    };
  }

  factory Hourly.fromMap(Map<String, dynamic> map) {
    return Hourly(
      dt: map['dt'] as int,
      temp: map['temp'] as num,
      weather: Weather.fromMap(map['weather'][0] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hourly.fromJson(String source) =>
      Hourly.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Hourly(dt: $dt, temp: $temp, weather: $weather)';

  @override
  bool operator ==(covariant Hourly other) {
    if (identical(this, other)) return true;

    return other.dt == dt && other.temp == temp && other.weather == weather;
  }

  @override
  int get hashCode => dt.hashCode ^ temp.hashCode ^ weather.hashCode;
}
