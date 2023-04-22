import 'dart:convert';

import 'package:store/models/productModel.dart';
import 'package:http/http.dart' as http;

class GetApi {
  List<ProductModel> productList = [];

  Future<List<ProductModel>> getPostApi() async {
    print("object");
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    var data = jsonDecode(response.body.toString());
    print(response.body);
    if (response.statusCode == 200) {
      print(productList);
      productList = [];

      productList.addAll(List<ProductModel>.from(
          jsonDecode(response.body.toString())
              .map((x) => ProductModel.fromJson(x))));

      return productList;
    } else {
      return productList;
    }
  }
}
