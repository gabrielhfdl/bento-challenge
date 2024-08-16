import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class InitialInfoCards extends StatelessWidget {
  final String title;
  final Color color;
  final Image image;

  const InitialInfoCards({
    super.key,
    required this.title,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(
        'redirect to route card',
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 12),
        height: 80,
        decoration: BoxDecoration(
          color: BentoColors.primaryLightGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(children: [
          Column(
            children: [
              const SizedBox(height: 24),
              SizedBox(
                width: 50,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: BentoColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: image,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
