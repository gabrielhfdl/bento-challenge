import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/widgets.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool seeAllItensButton;

  const SectionTitle({
    super.key,
    required this.title,
    required this.seeAllItensButton,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: BentoColors.primaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Spacer(),
        seeAllItensButton
            ? const Text('See all',
                style: TextStyle(
                    color: BentoColors.primaryLightGreen,
                    fontWeight: FontWeight.bold))
            : Container(),
      ],
    );
  }
}
