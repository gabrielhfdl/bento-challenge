import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class TopDealCard extends StatelessWidget {
  final String promotionItemDescription;
  final Color backgroundColor;
  final Image image;

  const TopDealCard({
    super.key,
    required this.backgroundColor,
    required this.image,
    required this.promotionItemDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top deal !',
                style: TextStyle(
                  color: BentoColors.primaryLightGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  promotionItemDescription,
                  style: const TextStyle(
                      color: BentoColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: BentoColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text(
                  'Shop Now',
                  style: TextStyle(
                    color: BentoColors.primaryLightGreen,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: image,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
