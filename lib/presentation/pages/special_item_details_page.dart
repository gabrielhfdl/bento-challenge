import 'package:bento_challenge/presentation/widgets/custom_app_bar.dart';
import 'package:bento_challenge/presentation/widgets/nutritional_information.dart';
import 'package:bento_challenge/presentation/widgets/rating_widget.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom:
                  120.0, // padding para evitar sobreposição com a coluna fixa
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.imageUrl.length,
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                        imageUrl: widget.imageUrl[index],
                        placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(
                          color: BentoColors.primaryLightGreen,
                        )),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      );
                    },
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
                    color: BentoColors.darkenBlue,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      NutritionalInformation(
                          label: "Vegetarian",
                          iconData: Icons.eco_outlined,
                          backgroundColor: BentoColors.lightGreen4),
                      NutritionalInformation(
                        label: "Halal Food",
                        iconData: Icons.no_meals,
                        backgroundColor: BentoColors.lightYellow,
                      ),
                      NutritionalInformation(
                        label: "Gluten-free",
                        iconData: Icons.grain,
                        backgroundColor: BentoColors.lightBlue,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: BentoColors.primaryBlue,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const Divider(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white, // Fundo branco para a coluna fixa
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: BentoColors.primaryLightGrey,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: BentoColors.primaryBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        textAlign: TextAlign.end,
                        '\$${widget.oldPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          print('add to cart action');
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
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: BentoColors.primaryBlue,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
