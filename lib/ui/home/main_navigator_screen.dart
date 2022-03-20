import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants.dart';
import '../../providers/main.dart';
import 'browse_screen/browse_screen.dart';
import 'home_screen/home_screen.dart';
import 'order_history_screen/order_history_screen.dart';
import 'product_screen/product_screen.dart';
import 'profile_screen/profile_screen.dart';

class MainNavigatorScreen extends StatelessWidget {
  const MainNavigatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> _tabs = [
      {
        'title': 'Home',
        'page': HomeScreen(),
      },
      {
        'title': 'Browse',
        'page': BrowseScreen(),
      },
      {
        'title': 'Product',
        'page': ProductScreen(),
      },
      {
        'title': 'Order History',
        'page': OrderHistoryScreen(),
      },
      {
        'title': 'Profile',
        'page': ProfileScreen(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _tabs[context.watch<MainProvider>().currentPageIndex]['title'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Center(
        child: _tabs[context.watch<MainProvider>().currentPageIndex]['page'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: context.watch<MainProvider>().currentPageIndex,
        onTap: (index) => context.read<MainProvider>().currentPageIndex = index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
            ),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
