
import 'package:ecommerence_app/models/products_model.dart';
import 'package:flutter/material.dart';

class ItemsDetails extends StatelessWidget {

  final Product product;
  const ItemsDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          product.title,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}