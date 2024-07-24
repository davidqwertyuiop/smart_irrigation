import 'package:flutter/foundation.dart';

@immutable
class Sensor {
  const Sensor({
    required this.humidity,
    required this.temperature,
    required this.soilMoisture,
    required this.ledState1,
    required this.ledState2,
    required this.ledState3,
    required this.ledState4,
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
            ledState1: json['LED_PIN_CONTROL1'] == null
                ? false
                : json['LED_PIN_CONTROL1'] as bool,
            ledState2: json['LED_PIN_CONTROL2'] == null
                ? false
                : json['LED_PIN_CONTROL2'] as bool,
            ledState3: json['LED_PIN_CONTROL3'] == null
                ? false
                : json['LED_PIN_CONTROL3'] as bool,
            ledState4: json['LED_PIN_CONTROL4'] == null
                ? false
                : json['LED_PIN_CONTROL4'] as bool,
        );

  final double humidity;
  final double temperature;
  final double soilMoisture;
  final bool ledState1;
  final bool ledState2;
  final bool ledState3;
  final bool ledState4;


  Map<String, Object?> toJson() {
    return {
      'Humidity': humidity,
      'Temperature': temperature,
      'SoilMoisture': soilMoisture,
      'LED_PIN_CONTROL1':ledState1,
      'LED_PIN_CONTROL2':ledState2,
      'LED_PIN_CONTROL3':ledState3,
      'LED_PIN_CONTROL4':ledState4,
    };
  }
}
