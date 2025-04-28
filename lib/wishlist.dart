import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  final List<String> wishlist;

  WishlistScreen({required this.wishlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Wishlist')),
      body: ListView.builder(
        itemCount: wishlist.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(wishlist[index]));
        },
      ),
    );
  }
}
