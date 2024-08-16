import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class ShopByCategorySection extends StatefulWidget {
  final String title;
  final String imageUrl;
  final Color backgroundColor;

  const ShopByCategorySection({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  State<ShopByCategorySection> createState() => _ShopByCategorySectionState();
}

class _ShopByCategorySectionState extends State<ShopByCategorySection> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('route to the category section');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.network(widget.imageUrl),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.title,
            style: const TextStyle(
              color: BentoColors.primaryBlue,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
