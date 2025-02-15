import "package:flutter/material.dart";

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});
  @override
  Widget build(context) {
    return Image.asset(
      'assets/images/logo.jpg',
      width: 150,
      height: 150,
      fit: BoxFit.cover,
    );
  }
}
