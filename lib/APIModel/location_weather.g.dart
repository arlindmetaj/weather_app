// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationWeather _$LocationWeatherFromJson(Map<String, dynamic> json) =>
    LocationWeather(
      name: json['name'] as String,
      country: json['country'] as String,
      region: json['region'] as String,
      lat: json['lat'] as String,
      lon: json['lon'] as String,
      timezoneId: json['timezone_id'] as String,
      localTime: json['localtime'] as String,
      localtimeEpoch: json['localtime_epoch'] as int,
      utcOffset: json['utc_offset'] as String,
    );

Map<String, dynamic> _$LocationWeatherToJson(LocationWeather instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'region': instance.region,
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone_id': instance.timezoneId,
      'localtime': instance.localTime,
      'localtime_epoch': instance.localtimeEpoch,
      'utc_offset': instance.utcOffset,
    };
