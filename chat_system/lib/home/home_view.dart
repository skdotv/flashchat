import 'package:chat_system/common/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _logoAnimationController;
  Animation _logoAnimation;

  Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _logoAnimationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _logoAnimationController.addListener(() {
      setState(() {});
    });
    _logoAnimation =
        Tween(begin: 0.0, end: 3.14).animate(_logoAnimationController);

    _logoAnimationController.repeat();
    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_animationController);
    // _animation =
    //     CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    _animationController.forward();

    // _animationController.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    //   print(status);
    // });
    _animationController.addListener(() {
      setState(() {});
      print(_animationController.value);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _logoAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Hero(
            tag: "logotag",
            child: Transform.rotate(
              angle: _logoAnimation.value,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/logo/energy.png",
                  height: 60,
                ),
              ),
            ),
          ),
          ColorizeAnimatedTextKit(
            speed: Duration(seconds: 2),
            repeatForever: true,
            isRepeatingAnimation: true,
            text: ["Flash Chat"],
            colors: [
              Colors.orange[300],
              Colors.orange[600],
              Colors.red[500],
              Colors.yellowAccent[200],
            ],
            // speed: Duration(milliseconds: 300),
            textStyle: TextStyle(
                fontSize: 50,
                fontFamily: 'Horizon',
                fontWeight: FontWeight.w900,
                color: Colors.yellowAccent[300]),
          ),
          button(
            color: Colors.green[400],
            onPressed: _loginFunction,
            label: "Log In",
          ),
          button(
            label: "Register",
            color: Colors.blue[300],
            onPressed: _registerFunction,
          )
        ],
      )),
    );
  }

  void _loginFunction() {
    Navigator.pushNamed(context, '/login');
  }

  void _registerFunction() {
    Navigator.pushNamed(context, '/register');
  }
}
