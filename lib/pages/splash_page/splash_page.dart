import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/helpers/constant.dart';
import 'package:weather_app/helpers/routes_helper.dart';
import 'package:weather_app/pages/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _doubleAnimation;

  @override
  void initState() {
    super.initState();
    // Difine Animation 1
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _doubleAnimation = Tween<double>(
      begin: 0.8,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    // Action Animations
    _animationController.forward();
    // after 2 seconds go to home page
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        // go to init page
        RouteHelper.routeHelper.pushAndRemoveUntil(const HomePage());
      },
    );
  }

  @override
  void dispose() {
    // dispose animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Transform.scale(
          scale: _doubleAnimation.value,
          child: Hero(
            tag: 'logo',
            child: Center(
              child: SizedBox(
                child: Image.asset(
                  kLogoImage,
                  height: 150.h,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
