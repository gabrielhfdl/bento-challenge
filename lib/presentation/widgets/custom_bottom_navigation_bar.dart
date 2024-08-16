import 'package:bento_challenge/utils/bento_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: BentoColors.primaryLightGreen),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer, color: BentoColors.lightGreen3),
          label: 'Delas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.store, color: Colors.red),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, color: BentoColors.lightGreen3),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle, color: BentoColors.lightGreen3),
          label: 'Account',
        ),
      ],
      selectedItemColor: BentoColors.primaryLightGreen,
      unselectedItemColor: BentoColors.lightGreen,
      type: BottomNavigationBarType.fixed,
    );
  }
}
