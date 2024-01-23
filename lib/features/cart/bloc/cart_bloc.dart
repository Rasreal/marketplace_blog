import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blog_eg/features/cart/ui/cart.dart';
import 'package:meta/meta.dart';

import '../../../data/cart_items.dart';
import '../../home/model/home_product_data_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveProductEvent>(cartRemoveProductEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems));
  }

  FutureOr<void> cartRemoveProductEvent(CartRemoveProductEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.toRemoveCartProduct);
    emit(CartProductRemovedActionState());
    emit(CartSuccessState(cartItems));
  }
}
