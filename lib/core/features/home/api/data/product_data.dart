

import 'package:dio/dio.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';

class ProductData{

  final Dio dio = Dio();

 Future<List<ProductModel>> getData()async{
    var res = await dio.get("https://elwekala.onrender.com/product/Laptops");

    List data = res.data["product"];

    print(data);
    List <ProductModel> product = data.map((e) => ProductModel.fromJson(e)).toList();
    print(product[0].image);
    return product;

  }
}


