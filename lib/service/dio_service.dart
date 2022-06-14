import 'package:dio/dio.dart';
import 'package:public_api/APIModel/cities_model.dart';

import '../APIModel/weather_model.dart';

class DioService {
  static final DioService _instance = DioService._internal();

  factory DioService() => _instance;

  Dio? dio;

  final String baseUrl = 'http://api.weatherstack.com/';

  DioService._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
          connectTimeout: 60*1000,
          receiveTimeout: 60*1000,
      ),
    );
    initializeInterceptors();
  }

  initializeInterceptors() {
    dio!.interceptors.add(InterceptorsWrapper(
        onError: (DioError err, ErrorInterceptorHandler handler) {
      return (handler.next(err));
    }, onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
      return (handler.next(options));
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      return (handler.next(response));
    }));
  }

  Future<Response> getRequest(String endPoint) async {
    Response response;
    try {
      response = await dio!.get(baseUrl + endPoint);
    } on DioError catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

  Future<WeatherModel> getWeather(String currentCity) async {
    Response weatherData = await dio!.get(
        "${baseUrl}current?access_key=6376ee19aa36033371d3337b7ecc93bb&query=$currentCity");

    //Prints the raw data returned by the server
    print("Weather Info: ${weatherData.data}");

    WeatherModel model = WeatherModel.fromJson(weatherData.data);

    return model;
  }

  Future<Cities> getCities() async {
    Response city = await dio!.get(
      "https://countriesnow.space/api/v0.1/countries",
    );
    print("Cities: ${city.data}");

    Cities cities = Cities.fromJson(city.data);

    return cities;
  }
}
