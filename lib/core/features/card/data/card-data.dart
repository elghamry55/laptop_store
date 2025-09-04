import 'package:dio/dio.dart';
import 'package:laptop_store/core/features/home/api/models/product_model.dart';

class CardData {
  static final Dio dio = Dio();

  static addCard({required String id}) async {
    var repo = await dio.post(
      "https://elwekala.onrender.com/cart/add",

      data: {"nationalId": "01210567022258", "productId": id, "quantity": 1},
    );
    print(repo.data);
  }

  static deleteCard({required String id}) async {
    var response = await dio.delete(
      "https://elwekala.onrender.com/cart/delete",

      data: {"nationalId": "01210567022258", "productId": id},
    );

    print(response.data);
  }


  static getCard() async {
    var repo = await dio.get(
      "https://elwekala.onrender.com/cart/allProducts",

      data: {"nationalId": "01210567022258"},
    );

    print(repo.data);

    List data = repo.data["products"];
    List<ProductModel> list = data
        .map((e) => ProductModel.fromJson(e))
        .toList();
    print(list[0].image);
    return list;
  }
}
