part of '../bloc/home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{

}
class HomeProductWishlistClick extends HomeEvent {
  final ProductDataModel clickedWishProduct;

  HomeProductWishlistClick(this.clickedWishProduct);
}

class HomeProductCartClick extends HomeEvent {
  final ProductDataModel clickedCartProduct;

  HomeProductCartClick(this.clickedCartProduct);
}

class HomeWishlistButtonNavEvent extends HomeEvent {

}
class HomeCartButtonNavEvent extends HomeEvent {

}
