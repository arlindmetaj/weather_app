import 'package:flutter/material.dart';
import 'package:public_api/APIModel/cities_model.dart';
import 'package:public_api/APIModel/weather_model.dart';
import 'package:public_api/service/dio_service.dart';
import 'package:geocoder/geocoder.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DioService dioService = DioService();
  Cities? cities;
  WeatherModel? weatherModel;

  String? selectVal;

  dynamic addresses;
  dynamic first;

  // From coordinates
  getLocation() async {
    // From a query
    const query = 'Tirana';
    addresses = await Geocoder.local.findAddressesFromQuery(query);
    first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");
    final coordinates = Coordinates(41.327953, 19.819025);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses.first;
    print("${first.featureName} : ${first.addressLine}");
  }

  void loadCities() async {
    Cities city = await dioService.getCities();
    if (mounted) {
      setState(() {
        cities = city;
      });
    }
  }

  void loadWeather(String currentCity) async {
    WeatherModel weather = await dioService.getWeather(currentCity);
    setState(() {
      weatherModel = weather;
    });
  }


  @override
  void initState() {
    super.initState();
    loadCities();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    final str = first.addressLine;
    const start = ',';
    const end = ',';

    final startIndex = str.indexOf(start);
    final endIndex = str.indexOf(end, startIndex + start.length);
    final addressName = str.substring(startIndex + start.length, endIndex);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0x260097A7),
          ),
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        centerTitle: true,
        title: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              hint: const Text(
                "Select a city",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: selectVal,
              onChanged: (value) {
                setState(
                  () {
                    selectVal = value.toString();
                  },
                );
                loadWeather(value.toString());

                //todo if selectedVal is null get GeoLocation
                //dioService.getWeather(first.addressLine);
                print(value.toString());
              },
              items: cities?.data[1].cities.map((itemOne) {
                return DropdownMenuItem(
                    value: itemOne,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          itemOne,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ));
              }).toList(),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            selectVal != null ? weatherModel!.location.name : addressName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
