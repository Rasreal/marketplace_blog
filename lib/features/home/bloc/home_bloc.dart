import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_eg/data/cart_items.dart';
import 'package:blog_eg/data/grocery_data.dart';
import 'package:blog_eg/data/wishlist_items.dart';
import 'package:meta/meta.dart';

import '../model/home_product_data_model.dart';

part '../bloc/home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeCartButtonNavEvent>(homeNavCartClick);
    on<HomeWishlistButtonNavEvent>(homeNavWishClick);
    on<HomeProductWishlistClick>(homeProductWishlistClick);
    on<HomeProductCartClick>(homeProductCartClick);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(GroceryData.products.map((e) =>
        ProductDataModel(
            id: e['id'],
            name: e['name'],
            category: e['category'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['image'])).toList()));
  }

  FutureOr<void> homeNavCartClick(
      HomeCartButtonNavEvent event, Emitter<HomeState> emit) {
    print("Cart Nav click");
    emit(HomeNavCartPageActionState());
  }

  FutureOr<void> homeNavWishClick(
      HomeWishlistButtonNavEvent event, Emitter<HomeState> emit) {
    print("Wish Nav click");
    emit(HomeNavWishlistPageActionState());
  }

  FutureOr<void> homeProductCartClick(
      HomeProductCartClick event, Emitter<HomeState> emit) {
    cartItems.add(event.clickedCartProduct);
    print("Cart Product click");
    print(cartItems);
    emit(HomeProductAddedToCartActionState());
  }

  FutureOr<void> homeProductWishlistClick(
      HomeProductWishlistClick event, Emitter<HomeState> emit) {
    wishItems.add(event.clickedWishProduct);
    print("Wish Product click");
    print(wishItems);
    emit(HomeProductAddedToWishlistActionState());
  }
}
