class CurrentWeather {
    final String city;
    final String countryCode;
    final String description;
    final String parameter;
    final num humidity;
    final num cloudiness;
    final num temp;
    final num pressure;
    final num windDirection;
    final num windSpeed;

    CurrentWeather({
        required this.city,
        required this.countryCode,
        required this.description,
        required this.parameter,
        required this.humidity,
        required this.cloudiness,
        required this.temp,
        required this.pressure,
        required this.windDirection,
        required this.windSpeed,
    });

    factory CurrentWeather.fromJson(Map<String, dynamic> json) {
        return CurrentWeather(
            city: json['name'] as String,
            countryCode: json['sys']['country'] as String,
            description: json['weather'][0]['description'] as String,
            parameter: json['weather'][0]['main'] as String,
            humidity: json['main']['humidity'] as num,
            cloudiness: json['clouds']['all'] as num,
            temp: json['main']['temp'] as num,
            pressure: json['main']['pressure'] as num,
            windDirection: json['wind']['deg'] as num,
            windSpeed: json['wind']['speed'] as num,
        );
    }
}