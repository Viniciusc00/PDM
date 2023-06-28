import 'package:app_comida/src/component/cart.dart';
import 'package:flutter/material.dart';

import '../widget/account.dart';
import '../widget/home.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String nomeRestaurante;
  final int corRestaurante;
  HomePage(
      {super.key,
      required this.email,
      required this.nomeRestaurante,
      required this.corRestaurante});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    UserHome(
        email: widget.email,
        nomeRestaurante: widget.nomeRestaurante,
        corRestaurante: widget.corRestaurante),
    ItemCarrinho(
        email: widget.email,
        nomeRestaurante: widget.nomeRestaurante,
        corRestaurante: widget.corRestaurante),
    UserAccount(
        email: widget.email,
        nomeRestaurante: widget.nomeRestaurante,
        corRestaurante: widget.corRestaurante),
  ];

  void _navigateBottomNavBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _navigateBottomNavBar,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Account'),
        ],
        selectedItemColor: Colors.red,
      ),
    );
  }
}
