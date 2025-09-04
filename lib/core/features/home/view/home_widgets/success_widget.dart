import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/favorite/cubit/favorite_cubit.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';
import 'package:laptop_store/core/features/home/view/home_screen/dateils_screen.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DateilsScreen(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.transparent,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff334155), Color(0xff1E293B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                      child: Image.network(
                        product.image,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: BlocBuilder<FavoriteCubit, FavoriteState>(
                        builder: (context, state) {
                          final isFavorite = state is FavoriteGetSuccessState &&
                              state.product.any((p) => p.id == product.id);

                          return IconButton(
                            onPressed: () {
                              final cubit = context.read<FavoriteCubit>();
                              if (isFavorite) {
                                cubit.deleteFavoriteCubit(id: product.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: const [
                                        Icon(Icons.favorite, color: Colors.white),
                                        SizedBox(width: 8),
                                        Text("Removed from favorites"),
                                      ],
                                    ),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.redAccent,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              } else {
                                cubit.addFavoriteCubit(product: product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: const [
                                        Icon(Icons.favorite, color: Colors.white),
                                        SizedBox(width: 8),
                                        Text("Added to favorites"),
                                      ],
                                    ),
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.green,
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              isFavorite ? Icons.favorite : Icons.favorite_border,
                              size: 30,
                              color: isFavorite ? Colors.white : Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.company,
                        style: TextStyle(fontSize: 15, color: Colors.white70),
                      ),
                      SizedBox(height: 5),
                      Text(
                        product.name,
                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${product.price} \$",
                        style: TextStyle(fontSize: 15, color: Colors.greenAccent, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
