import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/favorite/cubit/favorite_cubit.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';
import 'package:laptop_store/core/features/home/view/home_screen/dateils_screen.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DateilsScreen(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          color: Colors.transparent,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xff334155), width: 2),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: 120,
                  height: 120,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.broken_image,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        product.company,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "${product.price} \$",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.greenAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.read<FavoriteCubit>().deleteFavoriteCubit(id: product.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.favorite, color: Colors.white),
                            SizedBox(width: 8),
                            Text("Removed from favorites"),
                          ],
                        ),
                        duration: const Duration(seconds: 1),
                        backgroundColor: Colors.redAccent,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.redAccent,
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