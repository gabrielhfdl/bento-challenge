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
        color: BentoColors.lightGreen2,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Top deal !',
                style: TextStyle(
                  color: BentoColors.primaryGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                promotionItemDescription,
                style: const TextStyle(
                    color: BentoColors.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              const SizedBox(height: 8),
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
                    style:
                        TextStyle(color: BentoColors.lightGreen, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
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
