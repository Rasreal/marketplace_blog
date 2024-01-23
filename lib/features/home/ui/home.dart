import 'package:blog_eg/features/home/bloc/home_bloc.dart';
import 'package:blog_eg/features/home/ui/product_tile.dart';
import 'package:blog_eg/features/post/ui/post_page.dart';
import 'package:blog_eg/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cart/ui/cart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {
        if (state is HomeNavCartPageActionState) {
          print("123");
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        } else if (state is HomeNavWishlistPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PostPage()));
        } else if (state is HomeProductAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            content: Text(
              "Product is added to Cart",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            backgroundColor: Colors.red,
          ));
        } else if (state is HomeProductAddedToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            content: Text(
              "Product is added to Wishlist",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            backgroundColor: Colors.red.shade400,
          ));
        }
      },
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                  strokeWidth: 5,
                ),
              ),
            );
            break;
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.pinkAccent.shade400,
                title: Text("Groceries of Tech"),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavEvent());
                      },
                      icon: Icon(Icons.shopping_cart_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                      products: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );
          case HomeLoadedErrorState:
            return const Scaffold(
              body: Center(
                child: Text(
                    "Error caught, please wait or try again. \nSorry for the inconvenience"),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}

// return Scaffold(
// appBar: AppBar(
// backgroundColor: Colors.pinkAccent.shade400,
// title: Text("Groceries of Tech"),
// actions: [
// IconButton(
// onPressed: () {
// homeBloc.add(HomeWishlistButtonNavEvent());
// },
// icon: Icon(Icons.favorite)),
// IconButton(
// onPressed: () {
// homeBloc.add(HomeCartButtonNavEvent());
// },
// icon: Icon(Icons.shopping_cart)),
// ],
// ),
// );
