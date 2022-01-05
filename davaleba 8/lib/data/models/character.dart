class Character {
  String? name;
  String? homeworld;

  Character({this.name, this.homeworld});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      name: json['name'],
      homeworld: json['homeworld'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['homeworld'] = homeworld;
    return data;
  }
}
