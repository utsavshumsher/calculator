import 'package:flutter/material.dart';
 
class ButtonsView extends StatelessWidget {
  final String buttonText;
  final Function buttonTapped;
 
  const ButtonsView({
    super.key,
    required this.buttonText,
    required this.buttonTapped,
  });
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        buttonTapped();
      },
      borderRadius: BorderRadius.circular(20.0),
      child: Card(
        color: const Color.fromARGB(255, 200, 200, 200),
        child: Center(
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ), // Optional: Set border radius
    );
  }
}