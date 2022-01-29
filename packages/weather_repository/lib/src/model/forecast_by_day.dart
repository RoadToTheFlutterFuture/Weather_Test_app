class ForecastByDay {
    final String date;
    final String description;
    final String parameter;
    final int humidity;
    final int cloudiness;
    final double temp;
    final int pressure;
    final double windSpeed;
    final double windDirection;

    ForecastByDay({
        required this.date,
        required this.description,
        required this.parameter,
        required this.humidity,
        required this.cloudiness,
        required this.temp,
        required this.pressure,
        required this.windSpeed,
        required this.windDirection,
    });

    factory ForecastByDay.fromJson(Map<String, dynamic> json) {
        return ForecastByDay(
            date: json['dt_txt'] as String,
            description: json['weather'][0]['description'] as String,
            parameter: json['weather'][0]['main'] as String,
            humidity: json['humidity'] as int,
            cloudiness: json['clouds']['all'] as int,
            temp: json['main']['temp'] as double,
            pressure: json['main']['pressure'] as int,
            windSpeed: json['wind']['speed'] as double,
            windDirection: json['wind']['deg'] as double,
        );
    }
}