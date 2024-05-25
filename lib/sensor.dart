import 'package:flutter/foundation.dart';

@immutable
class Sensor {
  const Sensor({
    required this.humidity,
    required this.temperature,
    required this.soilMoisture,
    required this.ledState,
  });

  Sensor.fromJson(Map<String, Object?> json)
      : this(
            humidity: json['Humidity'] == null
                ? 0.0
                : double.parse(json['Humidity']! as String),
            temperature: json['Temperature'] == null
                ? 0.0
                : double.parse(json['Temperature']! as String),
            soilMoisture: json['SoilMoisture'] == null
                ? 0.0
                : double.parse(json['SoilMoisture']! as String),
            ledState: json['LED_PIN_CONTROL1'] == null
                ? false
                : json['LED_PIN_CONTROL1'] as bool,
        );

  final double humidity;
  final double temperature;
  final double soilMoisture;
  final bool ledState;


  Map<String, Object?> toJson() {
    return {
      'Humidity': humidity,
      'Temperature': temperature,
      'SoilMoisture': soilMoisture,
      'LED_PIN_CONTROL1':ledState,
    };
  }
}
