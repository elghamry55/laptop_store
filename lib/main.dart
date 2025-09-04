

import 'package:flutter/cupertino.dart';
import 'package:laptop_store/core/features/card/data/card-data.dart';
import 'package:laptop_store/core/features/favorite/data/favorite_data.dart';
import 'package:laptop_store/core/features/home/api/data/product_data.dart';
import 'package:laptop_store/my_app.dart';

void main(){

  ProductData product = ProductData();
  product.getData();

  CardData.getCard();
  FavoriteData.getFavorite();


  runApp(MyApp());
}
