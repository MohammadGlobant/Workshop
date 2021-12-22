import 'package:flutter/material.dart';
import 'landing.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2),(){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));});

    return Container(
      width: double.infinity,
      color: Colors.red[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.terrain,
            color: Colors.white,
            size: 50.0,
            ),
          SizedBox(height: 180.0,),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}