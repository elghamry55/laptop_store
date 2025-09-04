import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/card/cubit/card_cubit.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';

class DateilsScreen extends StatelessWidget {
  const DateilsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1E293B),
        title: Text(
          product.name,
          style: TextStyle(color: Colors.white, fontSize: width * 0.07),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: width * 0.07),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff334155), Color(0xff1E293B)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(width * 0.02),
          child: Card(
            color: Colors.transparent,
            elevation: 20,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff334155), width: width * 0.012),
                borderRadius: BorderRadius.circular(width * 0.05),
              ),
              child: Padding(
                padding: EdgeInsets.all(width * 0.03),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(product.image, fit: BoxFit.cover, width: width, height: height * 0.3),
                      SizedBox(height: height * 0.02),
                      ListTile(
                        leading: Icon(Icons.laptop, size: width * 0.07, color: Colors.white),
                        title: Text(
                          "Company: ${product.company}",
                          style: TextStyle(fontSize: width * 0.05, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.laptop_mac, size: width * 0.07, color: Colors.white),
                        title: Text(
                          "Status: ${product.status}",
                          style: TextStyle(fontSize: width * 0.05, color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.inventory, size: width * 0.07, color: Colors.white),
                        title: Text(
                          "Stock: ${product.countInStock}",
                          style: TextStyle(fontSize: width * 0.05, color: Colors.white),
                        ),
                      ),
                      Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width * 0.03)),
                        child: Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: Text(
                            "Description: ${product.description}",
                            style: TextStyle(fontSize: width * 0.045, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Padding(
                        padding: EdgeInsets.all(width * 0.03),
                        child: Row(
                          children: [
                            Text(
                              "Price: \$${product.price}",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            ElevatedButton.icon(
                              onPressed: () {
                                context.read<CardCubit>().addCardCubit(id: product.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: const [
                                        Icon(Icons.add_shopping_cart, color: Colors.white),
                                        SizedBox(width: 8),
                                        Expanded(child: Text("Added to cart successfully!")),
                                      ],
                                    ),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.add_shopping_cart, color: Colors.white),
                              label: const Text(
                                "Add to Cart",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.greenAccent.shade700,
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                elevation: 8,
                                shadowColor: Colors.black54,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(width * 0.03)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
