import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:laza_applicaiton/core/common/constants/colors/app_colors.dart';
import 'package:laza_applicaiton/core/common/textstyles/app_text_styles.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/carts/carts_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/products/home_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/wallet/wallet_page.dart';
import 'package:laza_applicaiton/features/home/presentation/screens/wishlist/favourites_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    FavouritesPage(),
    CartsPage(),
    WalletPage(),
  ];

  final List<String> labels = ['Home', 'Favorites', 'Cart', 'Wallet'];
  final List<IconData> icons = [
    IconlyLight.home,
    IconlyLight.heart,
    IconlyLight.bag,
    IconlyLight.wallet,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: AppColors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(4, (index) {
              final isSelected = _currentIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child:
                  isSelected
                      ? Text(
                    labels[index],
                    key: ValueKey("label_$index"),
                    style: AppTextStyles.inter.medium(
                      color: AppColors.backgroundNText,
                      fontSize: 11,
                    ),
                  )
                      : Icon(
                    icons[index],
                    key: ValueKey("icon_$index"),
                    color: Colors.grey,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
