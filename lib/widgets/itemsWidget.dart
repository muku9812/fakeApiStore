import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ItemsWidget extends StatefulWidget {
  final String image, title;
  final int? price;
  ItemsWidget(
      {super.key,
      required this.image,
      required this.price,
      required this.title});

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  String get description => description;

  String get image => image;

  String get title => title;

  get price => price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: const Color(0xFF4C53A5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "-50%",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "itemPage");
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: Image(
                  height: MediaQuery.of(context).size.height * .134,
                  image: NetworkImage(widget.image)),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Baskerville',
                fontSize: 18,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.only(bottom: 8),
          //   alignment: Alignment.centerLeft,
          //   child: ReadMoreText(
          //     widget.description,
          //     trimLines: 2,
          //     colorClickableText: Colors.pink,
          //     trimMode: TrimMode.Line,
          //     trimCollapsedText: 'Show more',
          //     trimExpandedText: 'Show less',
          //     moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.price.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  const Icon(
                    Icons.shopping_cart_checkout,
                    color: Color(0xFF4C53A5),
                    size: 18,
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
