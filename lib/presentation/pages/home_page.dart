import 'package:bento_challenge/presentation/widgets/inital_info_cards.dart';
import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
            )
          ],
        ),
      ),
    );
  }
}
