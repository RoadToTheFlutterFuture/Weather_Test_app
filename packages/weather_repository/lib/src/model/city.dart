class City {
    final int id;
    final String name;
    final int population; 

    const City({
        required this.id,
        required this.name,
        required this.population,
    });

    factory City.fromJson(Map<String, dynamic> json) {
        return City(
            id: json['id'] as int,
            name: json['name'] as String,
            population: json['population'] as int,
        );
    }
}