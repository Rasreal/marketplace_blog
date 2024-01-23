part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartRemoveProductEvent extends CartEvent{
  final ProductDataModel toRemoveCartProduct;

  CartRemoveProductEvent(this.toRemoveCartProduct);

}
