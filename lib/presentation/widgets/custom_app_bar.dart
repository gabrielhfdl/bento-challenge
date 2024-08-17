import 'package:flutter/material.dart';
import 'package:bento_challenge/utils/bento_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const CustomAppBar({
    required this.isFavorite,
    required this.onFavoritePressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: BentoColors.primaryBlue,
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : BentoColors.primaryBlue,
            ),
            onPressed: onFavoritePressed,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
