import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/favorite/cubit/favorite_cubit.dart';
import 'package:laptop_store/core/features/favorite/view/Favorite_widgets/favorite_widget.dart';
import 'package:laptop_store/pages.dart';

class FavoritHome extends StatelessWidget {
  const FavoritHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1E293B),
        leading: IconButton(onPressed: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Pages()),
                (route) => false,
          );

        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white ,size: 35,)),

        title: const Text(
          "Favorite",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff334155), Color(0xff1E293B)],
          ),
        ),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteGetSuccessState) {
              if (state.product.isEmpty) {
                return const Center(
                  child: Text(
                    "No favorites yet",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.product.length,
                itemBuilder: (context, index) {
                  return FavoriteWidget(product: state.product[index]);
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
