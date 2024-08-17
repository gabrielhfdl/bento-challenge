import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/data/model/today_special_model.dart';
import 'package:bento_challenge/presentation/bloc/bento_bloc.dart';
import 'package:bento_challenge/presentation/pages/special_item_details_page.dart';
import 'package:bento_challenge/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:bento_challenge/presentation/widgets/custom_floating_action_button.dart';
import 'package:bento_challenge/presentation/widgets/inital_info_cards.dart';
import 'package:bento_challenge/presentation/widgets/section_title.dart';
import 'package:bento_challenge/presentation/widgets/shop_by_category_section.dart';
import 'package:bento_challenge/presentation/widgets/today_special_card.dart';
import 'package:bento_challenge/presentation/widgets/top_deal_card.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BentoBloc _bentoBloc;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bentoBloc = Provider.of<BentoBloc>(context, listen: false);
      bentoBloc.getShopByCategory();
      bentoBloc.getTodaySpecial();
    });
  }

  @override
  void dispose() {
    _bentoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bentoBloc = Provider.of<BentoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delivery',
          style: TextStyle(
            fontSize: 20,
            color: BentoColors.primaryBlue,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: BentoColors.lightGreen,
              radius: 18,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/avatar.png',
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
      floatingActionButton: const CustomFloatinActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 24,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: InitialInfoCards(
                    title: 'ORDER AGAIN',
                    color: BentoColors.primaryBlue,
                    image: Image.asset('assets/images/order_again_icon.png'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InitialInfoCards(
                    title: 'LOCAL SHOP',
                    color: BentoColors.primaryBlue,
                    image: Image.asset('assets/images/local_shop_icon.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 155,
              child: PageView(
                padEnds: true,
                controller: _pageController,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: TopDealCard(
                      backgroundColor: BentoColors.lightGreen2,
                      image: Image.asset('assets/images/avogado.png'),
                      promotionItemDescription: 'FRESH AVOCADO UP TO 15% OFF',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: TopDealCard(
                      backgroundColor: const Color.fromARGB(255, 247, 241, 159),
                      image: Image.asset('assets/images/banana.png'),
                      promotionItemDescription: 'BANANA BUNCH UP TO 20% OFF',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: TopDealCard(
                      backgroundColor: const Color.fromARGB(255, 247, 173, 163),
                      image: Image.asset('assets/images/strawberry.png'),
                      promotionItemDescription:
                          'FRESH STRAWBERRY UP TO 10% OFF',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(
              height: 24,
            ),
            const SectionTitle(
              title: 'Shop by category',
              seeAllItensButton: false,
            ),
            StreamBuilder<List<ShopByCategoryModel>>(
              stream: bentoBloc.shopByCategoryStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final category = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ShopByCategorySection(
                            title: category.title,
                            imageUrl: category.image,
                            backgroundColor: category.title == 'Vegan'
                                ? BentoColors.lightGreen
                                : BentoColors.primaryGrey,
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: BentoColors.lightGreen,
                  ));
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            const SectionTitle(
              title: 'Today\'s Special',
              seeAllItensButton: true,
            ),
            const SizedBox(
              height: 12,
            ),
            StreamBuilder<List<TodaySpecialModel>>(
              stream: bentoBloc.todaySpecialStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 200,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        childAspectRatio: 1,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];

                        return TodaySpecialHomeCard(
                          color: item.title == 'Organic Orange Fresh'
                              ? BentoColors.lightOrange
                              : BentoColors.lightGreen3,
                          imageUrl: item.imagesUrl.first,
                          rating: item.rating.toString(),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SpecialItemDetailPage(
                                  imageUrl: item.imagesUrl,
                                  title: item.title,
                                  rating: item.rating.toString(),
                                  description: item.description,
                                  shop: item.shop,
                                  price: item.price,
                                  oldPrice: item.oldPrice,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: BentoColors.lightGreen,
                    ),
                  );
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
