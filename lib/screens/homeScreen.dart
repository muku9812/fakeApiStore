import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:store/models/productModel.dart';
import 'package:store/widgets/itemsWidget.dart';

import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> productList = [];

  Future<List<ProductModel>> getPostApi() async {
    print("object");
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    var data = jsonDecode(response.body.toString());
    // print(response.body);
    if (response.statusCode == 200) {
      // print(productList);
      productList = [];

      productList.addAll(List<ProductModel>.from(
          jsonDecode(response.body.toString())
              .map((x) => ProductModel.fromJson(x))));

      return productList;
    } else {
      return productList;
    }
  }

  @override
  void initState() {
    getPostApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              'Home Screen',
            )),
        bottomNavigationBar: ConvexAppBar(
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.shopping_cart, title: 'Cart'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                break;
              case 1:
                // do something for Discovery tab
                break;
              case 2:
                // do something for Add tab
                break;
              case 3:
                // do something for Message tab
                break;
              case 4:
                // do something for Profile tab
                break;
            }
          },
        ),
        body: FutureBuilder<List<ProductModel>>(
            future: getPostApi(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return const Text('Loading');
              } else {
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 6,
                            childAspectRatio: 1 / 1.9,
                            crossAxisCount: 2),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return ItemsWidget(
                          image: productList[index].image.toString(),
                          price: 22,
                          title: productList[index].title.toString());
                    });
              }
            }));
  }
}
