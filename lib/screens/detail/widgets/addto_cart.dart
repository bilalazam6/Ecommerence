
import 'package:ecommerence_app/models/products_model.dart';
import 'package:ecommerence_app/providers/cart_provider.dart';
import 'package:ecommerence_app/screens/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddtoCart extends StatefulWidget {
  final Product product;
  const AddtoCart({super.key, required this.product});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.black,
        ),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white,width: 2)
              ),
              child:  Row(
                children: [
                  IconButton(
                    onPressed: (){
                      if(currentIndex !=1){
                        setState(() {
                          currentIndex--;
                        });
                      }
                    },
                    iconSize: 10,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                 const SizedBox(width: 5),

                 Text(
                  currentIndex.toString(),
                  style:  const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),

                ),

                 const SizedBox(width: 5),
                   IconButton(
                    onPressed: (){
                       setState(() {
                          currentIndex++;
                        });
                    },
                    iconSize: 10,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.toggleFavorite(widget.product);
            const  snackBar=  SnackBar(content: Text(
                  "Successfully added!",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                  duration: Duration(seconds: 3),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 55,
                decoration: BoxDecoration(
                  color: kprimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                padding:const EdgeInsets.symmetric(horizontal: 50),
                child: const Text(
                  "Add to Cart",
                  style: TextStyle(
                    color:Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}