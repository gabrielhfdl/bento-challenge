import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class CustomFloatinActionButton extends StatelessWidget {
  const CustomFloatinActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(5),
      child: FloatingActionButton(
        disabledElevation: 0,
        onPressed: () {},
        backgroundColor: BentoColors.primaryBlue,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.store,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}
