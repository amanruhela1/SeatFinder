import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tasks/main.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Method For Delay of 2.5 seconds for the splash screen
  void initState(){
    Future.delayed(Duration(milliseconds: 2500), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SeatFinderScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Container(
            height: height * 0.4,
            // width: 300,
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              'assets/t.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}