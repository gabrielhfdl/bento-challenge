import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class NutritionalInformation extends StatelessWidget {
  final String label;
  final IconData iconData;
  final Color backgroundColor;

  const NutritionalInformation({
    super.key,
    required this.label,
    required this.iconData,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            size: 24,
            color: Colors.blueGrey,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: BentoColors.darkenBlue,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
