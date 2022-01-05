class Planet {
  String? climate;
  String? diameter;
  String? gravity;
  String? name;
  String? population;

  Planet({this.climate, this.diameter, this.gravity, this.name, this.population});

  factory Planet.fromJson(Map<String, dynamic> json) {
    return Planet(
      climate: json['climate'],
      diameter: json['diameter'],
      gravity: json['gravity'],
      name: json['name'],
      population: json['population'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['climate'] = climate;
    data['diameter'] = diameter;
    data['gravity'] = gravity;
    data['name'] = name;
    data['population'] = population;
    return data;
  }
}
