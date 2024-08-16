import 'package:bento_challenge/presentation/widgets/custom_app_bar.dart';
import 'package:bento_challenge/presentation/widgets/rating_widget.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpecialItemDetailPage extends StatefulWidget {
  final List<String> imageUrl;
  final String title;
  final String rating;
  final String description;
  final String shop;
  final double price;
  final double oldPrice;

  const SpecialItemDetailPage({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.description,
    required this.shop,
    required this.price,
    required this.oldPrice,
    super.key,
  });

  @override
  State<SpecialItemDetailPage> createState() => _SpecialItemDetailPageState();
}

class _SpecialItemDetailPageState extends State<SpecialItemDetailPage> {
  final PageController _pageController = PageController();
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
            Expanded(
              child: SizedBox(
                height: 500,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.imageUrl.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      widget.imageUrl[index],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: BentoColors.primaryLightGreen,
                  dotColor: BentoColors.primaryGrey,
                  dotHeight: 5,
                  dotWidth: 5,
                  expansionFactor: 5,
                ),
              ),
            ),
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
            const Divider(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Price',
                  style: TextStyle(
                    color: BentoColors.primaryGrey,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      widget.price.toStringAsFixed(2),
                      style: const TextStyle(
                        color: BentoColors.primaryBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      textAlign: TextAlign.end,
                      widget.oldPrice.toStringAsFixed(2),
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        print('imagine add cart action');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BentoColors.primaryLightGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        textStyle: const TextStyle(
                          color: BentoColors.primaryBlue,
                          fontSize: 16,
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(color: BentoColors.primaryBlue),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
