import 'package:flutter/material.dart';
import 'package:metric_converter/data/data.dart';
import 'package:metric_converter/models/car_model.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({
    Key ? key,
    required this.title
  }): super(key: key);
  final String title;

  @override
  State < CarsPage > createState() => _CarsPagePageState();
}

class _CarsPagePageState extends State < CarsPage > {

  List<CarModel> cars = <CarModel>[];

  @override
  Widget build(BuildContext context) {
    cars = getCars();

    return Listener(
        child: Scaffold(
          resizeToAvoidBottomInset : false,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'Cars',
              style: TextStyle(
                  fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/add',
                      arguments: -1 );
                },
              )
            ],
          ),

          body: Center(
            child: ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: cars.length,
                itemBuilder: (context, index){
                return Car(
                  model: cars[index].model,
                  imgUrl: cars[index].imgUrl,
                  year: cars[index].year,
                  id: cars[index].id
                );
                }),
          ),
        )
    );
  }
}

class Car extends StatelessWidget {
  final String model, imgUrl;
  final int year, id;
  const Car({Key? key,
    required this.model,
    required this.imgUrl,
    required this.year,
    required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only( bottom: 25.0),
        child: Column(
          children: <Widget> [
            Row(children: [Image.network(imgUrl, width: 370,height: 245)]),
            Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(model, style: const TextStyle(fontSize: 22))]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Center(child: Text('Year: ' + year.toString(), style: const TextStyle(fontSize: 22)))])
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/details',
        arguments: id );
        },
        onLongPress: (){
          Navigator.pushNamed(context, '/add',
              arguments: id );
    }
    );
  }
}
