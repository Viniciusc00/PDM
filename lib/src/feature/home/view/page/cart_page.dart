
import 'package:appComida/src/component/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

PreferredSizeWidget _minhaBarra(String texto) {
    return AppBar(
        title: Text(texto,
            style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Outfit',
                fontSize: 20)),
        backgroundColor: Colors.red,
        elevation: 0,
        );
  }

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _minhaBarra("Carrinho"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              itemCarrinho(context),
            ],
          ),
        ));
  }
}