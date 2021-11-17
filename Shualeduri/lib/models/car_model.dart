import '../data/data.dart';

class CarModel{
  late int id;
  late String model;
  late String brand;
  late int year;
  late String description;
  late String imgUrl;

  CarModel(
      {required this.id,
        required this.brand,
        required this.model,
        required this.year,
        required this.description,
        required this.imgUrl});
  }

void editCar(CarModel car, int index) {
  DUMMY_DATA.replaceRange(index, index + 1, [car]);
}

void addCar(CarModel car) {
  DUMMY_DATA.add(car);
}

void deleteCar(int id) {
  DUMMY_DATA.removeWhere((element) => element.id == id);
}