// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:weather_app/scr/models/weathers/daily.dart';
import 'package:weather_app/scr/models/weathers/hourly.dart';
import 'package:weather_app/scr/models/weathers/weather.dart';

class CurrentWeatherData {
  final int dt;
  final double temp;
  final int humidity;
  final int clouds;
  final int visibility;
  final double wind_speed;
  final Weather weather;
  final List<Hourly> hourly;
  final List<Daily> daily;

  CurrentWeatherData({
    required this.dt,
    required this.temp,
    required this.humidity,
    required this.clouds,
    required this.visibility,
    required this.wind_speed,
    required this.weather,
    required this.hourly,
    required this.daily,
  });

  CurrentWeatherData copyWith({
    int? dt,
    double? temp,
    int? humidity,
    int? clouds,
    int? visibility,
    double? wind_speed,
    Weather? weather,
    List<Hourly>? hourly,
    List<Daily>? daily,
  }) {
    return CurrentWeatherData(
      dt: dt ?? this.dt,
      temp: temp ?? this.temp,
      humidity: humidity ?? this.humidity,
      clouds: clouds ?? this.clouds,
      visibility: visibility ?? this.visibility,
      wind_speed: wind_speed ?? this.wind_speed,
      weather: weather ?? this.weather,
      hourly: hourly ?? this.hourly,
      daily: daily ?? this.daily,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dt': dt,
      'temp': temp,
      'humidity': humidity,
      'clouds': clouds,
      'visibility': visibility,
      'wind_speed': wind_speed,
      'weather': weather.toMap(),
      'hourly': hourly.map((x) => x.toMap()).toList(),
      'daily': daily.map((x) => x.toMap()).toList(),
    };
  }

  factory CurrentWeatherData.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherData(
      dt: map['current']['dt'] as int,
      temp: map['current']['temp'] as double,
      humidity: map['current']['humidity'] as int,
      clouds: map['current']['clouds'] as int,
      visibility: map['current']['visibility'] as int,
      wind_speed: map['current']['wind_speed'] as double,
      weather:
          Weather.fromMap(map['current']['weather'][0] as Map<String, dynamic>),
      hourly: List<Hourly>.from(
        (map['hourly'] as List<dynamic>).map<Hourly>(
          (x) => Hourly.fromMap(x as Map<String, dynamic>),
        ),
      ),
      daily: List<Daily>.from(
        (map['daily'] as List<dynamic>).map<Daily>(
          (x) => Daily.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherData.fromJson(String source) =>
      CurrentWeatherData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentWeatherData(dt: $dt, temp: $temp, humidity: $humidity, clouds: $clouds, visibility: $visibility, wind_speed: $wind_speed, weather: $weather, hourly: $hourly, daily: $daily)';
  }

  @override
  bool operator ==(covariant CurrentWeatherData other) {
    if (identical(this, other)) return true;

    return other.dt == dt &&
        other.temp == temp &&
        other.humidity == humidity &&
        other.clouds == clouds &&
        other.visibility == visibility &&
        other.wind_speed == wind_speed &&
        other.weather == weather &&
        listEquals(other.hourly, hourly) &&
        listEquals(other.daily, daily);
  }

  @override
  int get hashCode {
    return dt.hashCode ^
        temp.hashCode ^
        humidity.hashCode ^
        clouds.hashCode ^
        visibility.hashCode ^
        wind_speed.hashCode ^
        weather.hashCode ^
        hourly.hashCode ^
        daily.hashCode;
  }
}
