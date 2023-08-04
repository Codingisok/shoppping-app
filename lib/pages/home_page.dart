import 'package:flutter/material.dart';
import 'package:shopping/components/bottom_nav_bar.dart';
import 'package:shopping/pages/shop_page.dart';
import 'package:shopping/pages/widgets/drawer_home.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;
  // pages to display
  final List<Widget> _pages = [
// shop Page
    const ShopPage(),
// cart page
    const CartPage(),
  ];

  @override
  void initState() {
    // just for further operations
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyButtonNavBar(
        onTabChange: (index) => navigateBotomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: const DrawerHome(),
      body: _pages[_selectedIndex],
    );
  }

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBotomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
