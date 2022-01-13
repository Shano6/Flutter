import 'package:flutter/material.dart';
import 'package:rest_api_ex/screens/home_screen.dart';



class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 300.0,
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const Padding(
                padding:  EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(11.0),
                        ),
                      ),
                      fillColor: Color(0xff04a3a3),
                      filled: true,
                      contentPadding: EdgeInsets.all(5),
                    ),
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top: 40.0),
                 child: SizedBox(
                  height: 40,
                  width: 195,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff04a3a3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11.0),
                          side: const BorderSide(
                            color: Color(0xff04a3a3),
                            width: 0.0,
                          ),
                        ),
                      ),
                    ),
                    child: const Text('Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                  ),
              ),
               ),
            ],

          ),
        ),
      ),

    );
  }
}
