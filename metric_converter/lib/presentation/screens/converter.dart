import 'package:flutter/material.dart';
import 'package:metric_converter/logic/metric_helper.dart';

class Converter extends StatefulWidget {
  const Converter({
    Key ? key,
    required this.title
  }) : super(key: key);
  final String title;

  @override
  State <Converter> createState() => _ConverterPageState();
}

class _ConverterPageState extends State <Converter> {
  double enteredAmount = 0;
  String fromCurrency = "Km";
  String toCurrency = "M";
  double convertedAmount = 0;
  TextEditingController textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();


  final List <String> _dimensions = [
    'Km',
    'M',
    'Mile',
  ];

  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (_) => focusNode.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              'Metrics Converter',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),

          body: Stack(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 70),
                              child: Text('Number:', style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              )),
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: TextField(
                                controller: textEditingController,
                                keyboardType: TextInputType.number,
                                enableInteractiveSelection: false,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.blue,
                                  contentPadding: const EdgeInsets.all(10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 30,
                                    color: Colors.white
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    var amount = double.tryParse(text);
                                    if (amount != null) {
                                      enteredAmount = amount;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child:
                    Column(
                      children: [
                        Container(
                          width: 350,
                          height: 350,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 120),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 80),
                                      child: Text('From:', style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xffdeecfc),
                                          fontStyle: FontStyle.italic)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      width: 95,
                                      height: 40,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: fromCurrency,
                                          selectedItemBuilder: (_) =>
                                              _dimensions
                                                  .map((e) =>
                                                  Center(child: Text(e)))
                                                  .toList(),
                                          iconEnabledColor: Colors.blue,
                                          borderRadius: BorderRadius.circular(
                                              35),
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          items: _dimensions
                                              .map(
                                                (dimension) =>
                                                DropdownMenuItem<String>(
                                                  value: dimension,
                                                  child: Text(
                                                    dimension,
                                                    style:
                                                    const TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                          )
                                              .toList(),
                                          onChanged: (dynamic value) {
                                            setState(() {
                                              fromCurrency = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 40),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 120),
                                      child: Text('To:', style: TextStyle(
                                          fontSize: 30,
                                          color: Color(0xffdeecfc),
                                          fontStyle: FontStyle.italic)),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      width: 95,
                                      height: 40,
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: toCurrency,
                                          selectedItemBuilder: (_) =>
                                              _dimensions
                                                  .map((e) =>
                                                  Center(child: Text(e)))
                                                  .toList(),
                                          iconEnabledColor: Colors.blue,
                                          borderRadius: BorderRadius.circular(
                                              35),
                                          style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          items: _dimensions
                                              .map(
                                                (dimension) =>
                                                DropdownMenuItem<String>(
                                                  value: dimension,
                                                  child: Text(
                                                    dimension,
                                                    style:
                                                    const TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                          )
                                              .toList(),
                                          onChanged: (dynamic value) {
                                            setState(() {
                                              toCurrency = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffb0d4fc)
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 25),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 57),
                                child: Text('Result:', style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                )),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              height: 50,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    convertedAmount.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.blue,
                                ),
                                height: 50,
                              ),
                            ),
                          ],
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(35),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.blue
                            ),
                            height: 50,
                            width: 220,
                            child: MaterialButton(
                              height: 140.0,
                              minWidth: double.infinity,
                              color: Theme
                                  .of(context)
                                  .primaryColor,
                              textColor: Colors.white,
                              child: const Text(
                                "CONVERSION",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              onPressed: () =>
                              {
                                setState(() {
                                  convertedAmount = MetricHelper()
                                      .convertTo(
                                      enteredAmount, fromCurrency, toCurrency);
                                }),
                              },
                              splashColor: Colors.white,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.blue
                              ),
                              height: 50,
                              width: 220,
                              child: MaterialButton(
                                height: 140.0,
                                minWidth: double.infinity,
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                textColor: Colors.white,
                                child: const Text(
                                  "RESET",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: () =>
                                {
                                  setState(() {
                                    focusNode.unfocus();
                                    textEditingController.clear();
                                    enteredAmount = 0;
                                    convertedAmount = 0;
                                    textEditingController.text =
                                        enteredAmount.toString();
                                  })
                                },
                                splashColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
    );
  }
}