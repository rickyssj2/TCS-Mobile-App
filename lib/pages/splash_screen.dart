import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/auth_wrapper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;

  _SplashScreenState(){

    new Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => AuthWrapper()), (route) => false);
      });
    });

    new Timer(
      Duration(milliseconds: 10),(){
        setState(() {
          _isVisible = true; // Now it is showing fade effect and navigating to Login page
        });
      }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: <Color>[
            Theme.of(context).primaryColor,
            Theme.of(context).colorScheme.secondary,
          ],
        ),
      ),
      // color: Colors.white,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0,
        duration: Duration(milliseconds: 1200),
        child: Center(
          child: Container(
            height: 140.0,
            width: 140.0,
            child: Center(
              child: Column(
                children: [
                  Image.asset('assets/images/tcs_logo_2.png'),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                      'Food Quality App',
                    style: Theme.of(context).primaryTextTheme.caption,
                  ),
                ],
              ),
            ),
            // decoration: BoxDecoration(
            //   shape: BoxShape.circle,
            //   color: Colors.white,
            //   boxShadow: [
            //     BoxShadow(
            //       color: Colors.black.withOpacity(0.3),
            //       blurRadius: 2.0,
            //       offset: Offset(5.0, 3.0),
            //       spreadRadius: 2.0,
            //     )
            //   ]
            // ),
          ),
        ),
      ),
    );
  }
}