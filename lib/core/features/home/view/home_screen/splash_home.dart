import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laptop_store/core/features/auth/view/screen/auth_home.dart';
import 'package:laptop_store/pages.dart';

class Splashhome extends StatefulWidget {
  const Splashhome({super.key});

  @override
  State<Splashhome> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashhome> {
  na() {
    Future.delayed(
      Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthHome()),
      ),
    );
  }

  @override
  void initState() {
    na();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff334155), Color(0xff1E293B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.laptop ,size: 120, color: Colors.white,),
              SizedBox(height: 20,),
              Text("Laptop Store" ,style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.w700),)
            ],
          )
      ),
    );
  }
}
