// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/scr/models/weathers/temp.dart';
import 'package:weather_app/scr/models/weathers/weather.dart';

class Daily {
  final int dt;
  final Temp temp;
  final Weather weather;
  Daily({
    required this.dt,
    required this.temp,
    required this.weather,
  });

  Daily copyWith({
    int? dt,
    Temp? temp,
    Weather? weather,
  }) {
    return Daily(
      dt: dt ?? this.dt,
      temp: temp ?? this.temp,
      weather: weather ?? this.weather,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'temp': temp.toMap(),
      'weather': weather.toMap(),
    };
  }

  factory Daily.fromMap(Map<String, dynamic> map) {
    return Daily(
      dt: map['dt'] as int,
      temp: Temp.fromMap(map['temp'] as Map<String, dynamic>),
      weather: Weather.fromMap(map['weather'][0] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Daily.fromJson(String source) =>
      Daily.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Daily(dt: $dt, temp: $temp, weather: $weather)';

  @override
  bool operator ==(covariant Daily other) {
    if (identical(this, other)) return true;

    return other.dt == dt && other.temp == temp && other.weather == weather;
  }

  @override
  int get hashCode => dt.hashCode ^ temp.hashCode ^ weather.hashCode;
}
