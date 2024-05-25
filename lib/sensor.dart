import 'package:flutter/foundation.dart';

@immutable
class Sensor {
  const Sensor({
    required this.humidity,
    required this.temperature,
  });

  Sensor.fromJson(Map<String, Object?> json)
      : this(
            humidity: json['Humidity'] == null
                ? 0.0
                : (double.parse(json['Humidity']! as String)),
            temperature: json['Temperature'] == null
                ? 0.0
                : double.parse(json['Temperature'] as String));

  final double humidity;
  final double temperature;

  Map<String, Object?> toJson() {
    return {
      'Humidity': humidity,
      'Temperature': temperature,
    };
  }
}
