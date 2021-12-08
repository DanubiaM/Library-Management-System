import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final ColorFilter filter;
  final String url;
  const BackgroundImage({Key? key, required this.url, required this.filter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.black, Colors.black12],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            //'assets/images/loginScreenBackground.jpg'
            image: AssetImage('$url'),
            fit: BoxFit.cover,
            //ColorFilter.mode(Colors.black45, BlendMode.darken)
            colorFilter: filter,
          ),
        ),
      ),
    );
  }
}
