import 'package:flutter/material.dart';
import 'package:metric_converter/data/data.dart';
import 'package:metric_converter/models/car_model.dart';

class CarsDetail extends StatefulWidget {
  const CarsDetail({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;

  @override
  State < CarsDetail > createState() => _CarsDetailState();
}

class _CarsDetailState extends State < CarsDetail > {

  List<CarModel> cars = <CarModel>[];


  @override
  Widget build(BuildContext context) {
    final carId = ModalRoute.of(context)!.settings.arguments as int;
    cars = getCars();

    CarModel findCar(int id) => cars.firstWhere((e) => e.id == id);
    var car = findCar(carId);


    return Listener(
        child: Scaffold(
          resizeToAvoidBottomInset : false,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text(
              car.model,
              style: const TextStyle(
                  fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
                onPressed: () {
                  deleteCar(car.id);
                  Navigator.pop(context);
                },
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children:  [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Image.network(car.imgUrl, width: 340,height: 245)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Brand:',style: TextStyle(fontSize: 25)),
                          Text(car.brand, style: const TextStyle(fontSize: 25))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Model:',style: TextStyle(fontSize: 25)),
                          Text(car.model, style: const TextStyle(fontSize: 25))
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('Year:',style: TextStyle(fontSize: 25)),
                          Text(car.year.toString(), style: const TextStyle(fontSize: 25))
                        ]),
                  ),
                  Text(car.description, style: const TextStyle(fontSize: 25))
                ],
              ),
            ),
          ),
        )
    );
  }
}


