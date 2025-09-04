import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/card/cubit/card_cubit.dart';
import 'package:laptop_store/core/features/card/view/widgeds/card_widged.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';
import 'package:laptop_store/core/features/home/view/home_screen/first_home.dart';
import 'package:laptop_store/pages.dart';

class CardHome extends StatelessWidget {
  const CardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff1E293B),
          leading: IconButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Pages()),
                  (route) => false,
            );
          }, icon: const Icon(Icons.arrow_back_ios, color: Colors.white ,size: 35,)),
          title: Text(
            "Shopping Card",
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
          child: BlocBuilder<CardCubit, CardState>(
            builder: (context, state) {
              if (state is CardGetState) {
                if (state.product.isEmpty) {
                  return const Center(
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: state.product.length,
                  itemBuilder: (context, index) {
                    return CardWidget(product: state.product[index]);
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          )

        ),
      );
  }
}
