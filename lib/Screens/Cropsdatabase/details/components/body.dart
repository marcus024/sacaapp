import 'package:flutter/material.dart';
import 'package:saca/constants.dart';
import 'package:saca/Screens/Cropsdatabase/models/Product.dart';
import 'package:saca/Screens/Cropsdatabase/details/components/cart_counter.dart';
import 'add_to_cart.dart';
import 'color_and_size.dart';
import 'counter_with_fav_btn.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({required Key key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: pDefaultPadding,
                    right: pDefaultPadding,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                   /*   ColorAndSize(product: product),
                      SizedBox(height: pDefaultPadding / 2),
                      Description(product: product),
                      SizedBox(height: pDefaultPadding / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: pDefaultPadding / 2),
                      AddToCart(product: product)*/
                    ],
                  ),
                ),
                /*ProductTitleWithImage(product: product)*/
              ],
            ),
          )
        ],
      ),
    );
  }
}
