import 'package:ecommerence_app/providers/cart_provider.dart';
import 'package:ecommerence_app/screens/cart/check_out.dart';
import 'package:ecommerence_app/screens/constants.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final Provider = CartProvider.of(context);
    final finalList = Provider.cart;
    // For Quantity add and sub
    productQuantity(IconData icon, int index){
      return GestureDetector(
        onTap: () {
          setState(() {
            icon == Icons.add 
            ? Provider.incrementQtn(index) 
            : Provider.decrementQtn(index);
          });
        },
        child: Icon(icon, size: 20,),
      );
    }

    return Scaffold(
      // For Total and Checkout 
      bottomSheet:  CheckOutBox(),
      backgroundColor: kcontentColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => const BottomAppBar(),
                          ),
                        );
                      },
                      
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      "My Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                    Container(),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: finalList.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final cartItems = finalList[index];
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.only(bottom: 50,top:10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: kcontentColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(cartItems.image), //cartImage.image
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItems.title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        cartItems.category,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "\$${cartItems.price}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 35,
                            left: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: (){
                                    finalList.removeAt(index);
                                    setState(() {
                                      
                                    });
                                  },
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  iconSize: 22,
                                ),
                               const SizedBox(height: 10),
                               Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: kcontentColor,
                                  border: Border.all(
                                    color: Colors.grey.shade200,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child:  Row(
                                  children: [
                                    const SizedBox(width: 10),
                                    productQuantity(Icons.add, index),
                                    const SizedBox(width: 10),
                                    Text(
                                      cartItems.quantity.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    productQuantity(Icons.remove, index),
                                    const SizedBox(width: 100),
                                  ],
                                ),
                               ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 50,),
                        ],
                      );
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
// Use provider state mangement to show add to cat items
// User click on add to cart
// and same as favorite