import 'package:blog_eg/features/cart/bloc/cart_bloc.dart';
import 'package:blog_eg/features/home/bloc/home_bloc.dart';
import 'package:blog_eg/features/home/model/home_product_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartProductTileWidget extends StatelessWidget {
  final ProductDataModel products;
  final CartBloc cartBloc;
  const CartProductTileWidget(
      {Key? key, required this.products, required this.cartBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Image.network(
              products.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(
                  products.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Colors.lightGreen.shade500.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  products.category,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 16),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: Text(products.description),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${products.price}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        cartBloc.add(CartRemoveProductEvent(products));
                      },
                      icon: const Icon(Icons.shopping_cart)),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
