// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CitiesData _$CitiesDataFromJson(Map<String, dynamic> json) => CitiesData(
      country: json['country'] as String,
      cities:
          (json['cities'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CitiesDataToJson(CitiesData instance) =>
    <String, dynamic>{
      'country': instance.country,
      'cities': instance.cities,
    };
