import 'package:json_annotation/json_annotation.dart';

part 'cities_model_data.g.dart';

@JsonSerializable()
class CitiesData {
  @JsonKey(name: 'country')
  late final String country;

  @JsonKey(name: 'cities')
  late final List<String> cities;

  CitiesData({
    required this.country,
    required this.cities,
  });

  factory CitiesData.fromJson(Map<String, dynamic> data) =>
      _$CitiesDataFromJson(data);

  Map<String, dynamic> toJson() => _$CitiesDataToJson(this);
}
