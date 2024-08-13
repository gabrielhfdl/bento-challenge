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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: InitialInfoCards(
                    title: 'Find Food',
                    icon: Icons.search,
                    color: BentoColors.primaryBlue,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: InitialInfoCards(
                    title: 'Find Food',
                    icon: Icons.search,
                    color: BentoColors.primaryBlue,
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
