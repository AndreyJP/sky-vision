import 'package:sky_vision/model/forecast.dart';

class City{
  static final City instance = City(); 

  late String _name;
  late String _date;
  late String _hour;
  late int _temperature;
  late String _description;
  late List<Forecast> _forecasts;

	String getName() {
		return _name;
	}

	void setName(String name) {
		_name = name;
	}

	String getDate() {
		return _date;
	}

	void setDate(String date) {
		_date = date;
	}

	String getHour() {
		return _hour;
	}

	void setHour(String hour) {
		_hour = hour;
	}

	int getTemperature() {
		return _temperature;
	}

	void setTemperature(int temperature) {
		_temperature = temperature;
	}

	String getDescription() {
		return _description;
	}

	void setDescription(String description) {
		_description = description;
	}

  List<Forecast> getForecasts(){
    return _forecasts;
  }

  void setForecasts(List<Forecast> forecasts){
    _forecasts = forecasts;
  }

}