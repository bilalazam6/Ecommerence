
import 'package:ecommerence_app/models/products_model.dart';
import 'package:ecommerence_app/providers/favorite_provider.dart';
import 'package:flutter/material.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
     final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          // ignore: prefer_const_constructors
          icon: Icon(Icons.arrow_back_ios),
          ),
          const Spacer(),

          IconButton(
          style: IconButton.styleFrom(
            backgroundColor:Colors.white,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {},
          // ignore: prefer_const_constructors
          icon: Icon(Icons.share_outlined),
          ),
         const SizedBox(width: 10),

          IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {
            provider.toggleFavorite(product);
          },
          
          icon: Icon(
            provider.isExist(product) ?
            Icons.favorite: Icons.favorite_border,
            color: Colors.black,
            size: 25,
          ),
          ),
        ],
      ),
    );
  }
}