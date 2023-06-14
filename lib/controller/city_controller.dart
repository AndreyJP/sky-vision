import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sky_vision/model/city.dart';
import 'package:sky_vision/model/forecast.dart';

class CityController{
  static final CityController instance = CityController();
  static const request = 'https://api.hgbrasil.com/weather?key=b9174d9b';

  Future<bool> getCity(String city) async{

    http.Response response  = await http.get(Uri.parse('$request&city_name=$city'));

    Map results = jsonDecode(response.body);
    //print(results['results']['forecast']);

    if(results['results']['forecast'].isNotEmpty){
      City.instance.setName(results['results']['city']);
      City.instance.setDate(results['results']['date']);
      City.instance.setHour(results['results']['time']);
      City.instance.setTemperature(results['results']['temp']);
      City.instance.setDescription(results['results']['description']);

      List<Forecast> forecasts = [];

      results['results']['forecast'].forEach((forecastResult){

        Forecast forecast = Forecast();

        forecast.setDate(forecastResult['date']);
        forecast.setMaxTemp(forecastResult['max']);
        forecast.setMinTemp(forecastResult['min']);
        forecast.setRainProbability(forecastResult['rain_probability']);
        forecast.setDescription(forecastResult['description']);
        forecast.setCity(City.instance);

        forecasts.add(forecast);
      });

      City.instance.setForecasts(forecasts);

      return true;
    }else{
      return false;
    }
  }
}