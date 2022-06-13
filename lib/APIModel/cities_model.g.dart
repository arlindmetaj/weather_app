// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cities _$CitiesFromJson(Map<String, dynamic> json) => Cities(
      error: json['error'] as bool,
      msg: json['msg'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CitiesData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitiesToJson(Cities instance) => <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.data,
    };
