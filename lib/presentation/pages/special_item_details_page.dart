import 'package:bento_challenge/data/model/today_special_model.dart';
import 'package:bento_challenge/presentation/widgets/custom_app_bar.dart';
import 'package:bento_challenge/presentation/widgets/nutritional_information.dart';
import 'package:bento_challenge/presentation/widgets/rating_widget.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpecialItemDetailPage extends StatefulWidget {
  final TodaySpecialModel item;

  const SpecialItemDetailPage({
    required this.item,
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
                left: 16.0, right: 16.0, top: 16.0, bottom: 120.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.item.imagesUrl.length,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1.0;
                          if (_pageController.position.haveDimensions) {
                            value = _pageController.page! - index;
                            value = (1 - (value.abs() * 0.2)).clamp(0.0, 1.0);
                          }
                          return Center(
                            child: Transform.scale(
                              scale: value,
                              child: CachedNetworkImage(
                                imageUrl: widget.item.imagesUrl[index],
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                  color: BentoColors.primaryLightGreen,
                                )),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
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
                    count: widget.item.imagesUrl.length,
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        widget.item.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: BentoColors.primaryBlue,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    RatingWidget(rating: widget.item.rating.toString()),
                  ],
                ),
                Text(
                  'Shop: ${widget.item.shop}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: BentoColors.darkenBlue,
                    fontFamily: 'Poppins',
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
                          backgroundColor: BentoColors.lightYellow),
                      NutritionalInformation(
                          label: "Gluten-free",
                          iconData: Icons.grain,
                          backgroundColor: BentoColors.lightBlue),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
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
                  widget.item.description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    color: BentoColors.darkenBlue,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: BentoColors.primaryLightGrey,
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      height: 1.0,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${widget.item.price.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: BentoColors.primaryBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                              children: const [
                                WidgetSpan(
                                  child: SizedBox(
                                    width: 8,
                                  ),
                                ),
                              ],
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.bottom,
                              child: Text(
                                '\$${widget.item.oldPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor:
                                      const Color.fromARGB(166, 158, 158, 158),
                                  decorationThickness: 2,
                                ),
                              ),
                            ),
                          ],
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
                            vertical: 12,
                            horizontal: 40,
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(
                            color: BentoColors.primaryBlue,
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
