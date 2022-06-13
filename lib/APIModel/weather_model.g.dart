// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      request: Request.fromJson(json['request'] as Map<String, dynamic>),
      location:
          LocationWeather.fromJson(json['location'] as Map<String, dynamic>),
    )..current = Current.fromJson(json['current'] as Map<String, dynamic>);

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'request': instance.request,
      'location': instance.location,
      'current': instance.current,
    };
