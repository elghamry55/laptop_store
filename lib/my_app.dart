import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptop_store/core/features/auth/cubit/auth_cubit.dart';
import 'package:laptop_store/core/features/auth/view/screen/auth_home.dart';
import 'package:laptop_store/core/features/card/cubit/card_cubit.dart';
import 'package:laptop_store/core/features/favorite/cubit/favorite_cubit.dart';
import 'package:laptop_store/core/features/home/api/cubit/body_cubit.dart';
import 'package:laptop_store/core/features/home/view/home_screen/splash_home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          BodyCubit()
            ..getDataCubit(),
        ),
        BlocProvider(
          create: (context) => CardCubit()..getCardCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit()..getFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(home: Splashhome()),
    );
  }
}
