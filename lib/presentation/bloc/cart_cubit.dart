import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String color;
  final String size;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.color,
    required this.size,
    this.quantity = 1,
  });
}

class CartState {
  final List<CartItem> items;
  double get total =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);

  CartState(this.items);

  CartState copyWith({List<CartItem>? items}) {
    return CartState(items ?? this.items);
  }
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  void addItem(CartItem item) {
    final existing = state.items
        .where(
          (i) =>
              i.id == item.id && i.color == item.color && i.size == item.size,
        )
        .firstOrNull;
    if (existing != null) {
      existing.quantity++;
    } else {
      state.items.add(item);
    }
    emit(state.copyWith(items: List.from(state.items)));
  }

  void removeItem(String id) {
    state.items.removeWhere((i) => i.id == id);
    emit(state.copyWith(items: List.from(state.items)));
  }

  void updateQuantity(String id, int quantity) {
    final item = state.items.firstWhere((i) => i.id == id);
    item.quantity = quantity;
    emit(state.copyWith(items: List.from(state.items)));
  }
}
