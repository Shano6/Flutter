import 'package:flutter/material.dart';
import 'package:metric_converter/data/data.dart';
import 'package:metric_converter/models/car_model.dart';

class CarsAdd extends StatefulWidget {
  const CarsAdd({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CarsAdd> createState() => _CarsAddState();
}

class _CarsAddState extends State<CarsAdd> {
  List<CarModel> cars = <CarModel>[];
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute
        .of(context)!
        .settings
        .arguments as int;
    cars = getCars();

    var car;
    int index = 1;

    TextEditingController imageUrlController = TextEditingController();
    TextEditingController carIdController = TextEditingController();
    TextEditingController carBrandController = TextEditingController();
    TextEditingController carModelController = TextEditingController();
    TextEditingController carYearController = TextEditingController();
    TextEditingController carDescriptionController = TextEditingController();

    if (carId > -1) {
      int findCar(int id) =>
          cars.indexWhere((e) => e.id == id);

      index = findCar(carId);

      imageUrlController.text = cars[index].imgUrl;
      carIdController.text = cars[index].id.toString();
      carBrandController.text = cars[index].brand;
      carModelController.text = cars[index].model;
      carYearController.text = cars[index].year.toString();
      carDescriptionController.text = cars[index].description;

      car = cars[index];
    }

    CarModel newCar;
    return Listener(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              carId > -1 ? 'Edit Car' : 'Add Car',
              style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        controller: imageUrlController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Car Image URL',
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        controller: carIdController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Car ID',
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        controller: carBrandController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Car Brand',
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        controller: carModelController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Car Model',
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        controller: carYearController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Car Year',
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: SizedBox(
                      width: 250,
                      height: 50,
                      child: TextField(
                        controller: carDescriptionController,
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: 'Car Description',
                          contentPadding: EdgeInsets.all(10.0),
                          border: OutlineInputBorder(),
                        ),
                        style:
                        const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MaterialButton(
                              height: 45.0,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              textColor: Colors.white,
                              child: const Text(
                                'Back',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: () =>
                              {
                                setState(() {
                                  Navigator.pop(context);
                                })
                              },
                              splashColor: Colors.white,
                            ),
                            MaterialButton(
                              height: 45.0,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              textColor: Colors.white,
                              child: Text(
                                carId > -1 ? 'Edit' : 'Add',
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: () =>
                              {
                                if(
                                imageUrlController.text.isNotEmpty &&
                                    carIdController.text.isNotEmpty &&
                                    carBrandController.text.isNotEmpty &&
                                    carModelController.text.isNotEmpty &&
                                    carYearController.text.isNotEmpty &&
                                    carDescriptionController.text.isNotEmpty

                                ){
                                  if(carId<0){
                                    newCar = CarModel(
                                        id: int.parse(carIdController.text),
                                        brand: carBrandController.text,
                                        model: carModelController.text,
                                        year: int.parse(carYearController.text),
                                        description: carDescriptionController.text,
                                        imgUrl: imageUrlController.text),

                                    addCar(newCar),
                                    Navigator.pop(context),

                                  } else{
                                    car.imgUrl = imageUrlController.text,
                                    car.id = int.parse(carIdController.text),
                                    car.brand= carBrandController.text,
                                    car.model= carModelController.text,
                                    car.year= int.parse(carYearController.text),
                                    car.description= carDescriptionController.text,

                                    // editCar(car, index),
                                    Navigator.pop(context),
                                  }
                                } ,
                              },
                              splashColor: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
