import 'package:bento_challenge/presentation/widgets/custom_app_bar.dart';
import 'package:bento_challenge/presentation/widgets/rating_widget.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class SpecialItemDetailPage extends StatefulWidget {
  final List<String> imageUrl;
  final String title;
  final String rating;
  final String description;
  final String shop;

  const SpecialItemDetailPage({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.description,
    required this.shop,
    super.key,
  });

  @override
  State<SpecialItemDetailPage> createState() => _SpecialItemDetailPageState();
}

class _SpecialItemDetailPageState extends State<SpecialItemDetailPage> {
  bool _isFavorite = false;

  void _setFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        isFavorite: _isFavorite,
        onFavoritePressed: () {
          _setFavorite();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('asdsa')),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: BentoColors.primaryBlue,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                RatingWidget(rating: widget.rating),
              ],
            ),
            Text(
              'Shop: ${widget.shop}',
              style: const TextStyle(
                fontSize: 14,
                color: BentoColors.primaryGrey,
              ),
            ),
            const SizedBox(height: 16),

            // colocar as caracteristicas aqui
            const Text(
              'Details',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: BentoColors.primaryBlue),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Add to Cart'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
