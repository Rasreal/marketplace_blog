part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState(this.products);
}

class HomeLoadedErrorState extends HomeState {}

class HomeNavWishlistPageActionState extends HomeActionState {}

class HomeNavCartPageActionState extends HomeActionState {}

class HomeProductAddedToCartActionState extends HomeActionState {}

class HomeProductAddedToWishlistActionState extends HomeActionState {}


