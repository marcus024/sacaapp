import 'package:flutter/material.dart';
import 'package:saca/constants.dart';
import 'package:saca/Screens/Cropsdatabase/models/Product.dart';

import '../../../constants.dart';

class Description extends StatelessWidget {
  const Description({
    required Key key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: pDefaultPadding),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
