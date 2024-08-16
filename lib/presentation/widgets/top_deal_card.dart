import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class TopDealCard extends StatelessWidget {
  final String promotionText;
  final Color backgroundColor;
  final Image image;

  const TopDealCard({
    super.key,
    required this.promotionText,
    required this.backgroundColor,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: BentoColors.lightGreen2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: BentoColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Shop Now',
                  style: TextStyle(color: BentoColors.lightGreen),
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
    );
  }
}
