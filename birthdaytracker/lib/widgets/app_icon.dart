import 'package:flutter/material.dart';

class MyAppIcon extends StatelessWidget {
  const MyAppIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                blurRadius: 10,
                spreadRadius: 5,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            height: 150,
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(color: Color.fromRGBO(42, 42, 42, 0.6)),
                  BoxShadow(color: Color.fromRGBO(155, 80, 148, 0.2)),
                  BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.75),
                      spreadRadius: -5,
                      blurRadius: 50)
                ]),
                child: const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 120,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
