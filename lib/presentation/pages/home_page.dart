import 'package:bento_challenge/data/model/shop_by_category_model.dart';
import 'package:bento_challenge/presentation/bloc/bento_bloc.dart';
import 'package:bento_challenge/presentation/widgets/carrousel_top_deal_cards.dart';
import 'package:bento_challenge/presentation/widgets/inital_info_cards.dart';
import 'package:bento_challenge/presentation/widgets/shop_by_category_section.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BentoBloc _bentoBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bentoBloc = Provider.of<BentoBloc>(context, listen: false);
      bentoBloc.getShopByCategory();
    });
  }

  @override
  void dispose() {
    _bentoBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _bentoBloc = Provider.of<BentoBloc>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Delivery',
          style: TextStyle(
            fontFamily: 'Sanseriffic',
            fontSize: 20,
            color: BentoColors.primaryBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: BentoColors.lightGreen,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            const CarouselWidget(),
            const SizedBox(
              height: 24,
            ),
            StreamBuilder<List<ShopByCategoryModel>>(
              stream: _bentoBloc.shopByCategoryStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final category = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ShopByCategorySection(
                            title: category.title,
                            imageUrl: category.image,
                          ),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
