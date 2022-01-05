import 'package:dio/dio.dart';
import 'package:rest_api_ex/data/models/planet.dart';

class PlanetRepository {
  Planet planet = Planet();
  Dio dio = Dio();

  Future<Planet> fetchPlanet(String url) async {
    final response = await dio.get(url);
    // print(response.data);
    if (response.statusCode == 200) {
      Planet loadedPlanet = Planet.fromJson(response.data);
      planet = loadedPlanet;
      return planet;
    }
    return planet;
  }
}