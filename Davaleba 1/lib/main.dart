import 'package:flutter/material.dart';
import 'package:davaleba/Images.dart';

void main() {

  runApp(const ImgApp());
}

class ImgApp extends StatelessWidget {
  const ImgApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Img App',
      home: const Img()
    );
  }
}

class Img extends StatefulWidget {
  const Img({Key? key}) : super(key: key);

  @override
  _ImgState createState() => _ImgState();
}

class _ImgState extends State<Img> {

  String displayImage=giraffe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animals'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(displayImage, width: 450, height: 300,),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              displayImage = giraffe;
                            });
                          },
                          child: const Text('Giraffe')),

                      TextButton(
                          onPressed: () {
                            setState(() {
                              displayImage = horse;
                            });
                          },
                          child: const Text('Horse')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              displayImage = hedgehog;
                            });
                          },
                          child: const Text('Hedgehog')),

                      TextButton(
                          onPressed: () {
                            setState(() {
                              displayImage = dog;
                            });
                          },
                          child: const Text('Dog')),
                    ],
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}





