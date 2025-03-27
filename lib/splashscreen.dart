import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silverscreen/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _silverController;
  late AnimationController _screenController;
  List<Animation<double>> _silverAnimations = [];
  List<Animation<double>> _screenAnimations = [];
  final String silverWord = "SILVER";
  final String screenWord = "SCREEN";

  @override
  void initState() {
    super.initState();

    _silverController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _screenController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _initializeAnimations();

    _silverController.forward();

    Future.delayed(const Duration(seconds: 1), () {
      _screenController.forward();
    });

    Future.delayed(const Duration(seconds: 4), () {
    Get.to(Login());
    });
  }

  void _initializeAnimations() {
    for (int i = 0; i < silverWord.length; i++) {
      _silverAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _silverController,
            curve: Interval(i / silverWord.length, (i + 1) / silverWord.length, curve: Curves.easeIn),
          ),
        ),
      );
    }

    for (int i = 0; i < screenWord.length; i++) {
      _screenAnimations.add(
        Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _screenController,
            curve: Interval(i / screenWord.length, (i + 1) / screenWord.length, curve: Curves.easeIn),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(silverWord.length, (index) {
                return FadeTransition(
                  opacity: _silverAnimations[index],
                  child: Text(
                    silverWord[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 10,

                    ),
                  ),
                );
              }),
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(screenWord.length, (index) {
                return FadeTransition(
                  opacity: _screenAnimations[index],
                  child: Text(
                    screenWord[index],
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 15,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _silverController.dispose();
    _screenController.dispose();
    super.dispose();
  }
}
