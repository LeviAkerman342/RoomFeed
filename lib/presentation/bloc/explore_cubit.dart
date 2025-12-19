import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';

class ExploreState {
  final List<String> recentSearches;
  final List<Product> products;
  final bool isSearching;
  final Map<String, dynamic> filters;

  ExploreState({
    this.recentSearches = const [],
    this.products = const [],
    this.isSearching = false,
    this.filters = const {},
  });

  ExploreState copyWith({
    List<String>? recentSearches,
    List<Product>? products,
    bool? isSearching,
    Map<String, dynamic>? filters,
  }) {
    return ExploreState(
      recentSearches: recentSearches ?? this.recentSearches,
      products: products ?? this.products,
      isSearching: isSearching ?? this.isSearching,
      filters: filters ?? this.filters,
    );
  }
}

class ExploreCubit extends Cubit<ExploreState> {
  ExploreCubit() : super(ExploreState());

  void loadRecentSearches() {
    // TODO: из Hive
    emit(state.copyWith(recentSearches: ['Shoes', 'Jacket', 'Pants']));
  }

  void addRecentSearch(String query) {
    final updated = [query, ...state.recentSearches.where((s) => s != query)].take(5).toList();
    _performSearch();
    emit(state.copyWith(recentSearches: updated));
  }

  void _performSearch() {
    final mockProducts = [
      Product(title: 'Amazing Shoes', price: 12.00, imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500'),
      Product(title: 'Fashion Shoes', price: 89.00, imageUrl: 'https://images.unsplash.com/photo-1562184554-5f1a0a2471b5?w=500'),
      Product(title: 'Fantastic Shoes', price: 75.00, imageUrl: 'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=500'),
      Product(title: 'Stunning Shoes', price: 65.00, imageUrl: 'https://images.unsplash.com/photo-1515955656352-a7f0a9f6e5e7?w=500'),
      Product(title: 'Wonderful Shoes', price: 105.00, imageUrl: 'https://images.unsplash.com/photo-1605733513597-a8f8341080e8?w=500'),
    ];
    emit(state.copyWith(products: mockProducts, isSearching: true));
  }

  void applyFilters(Map<String, dynamic> filters) {
    emit(state.copyWith(filters: filters));
    _performSearch();
  }

  void clearFilters() {
    emit(state.copyWith(filters: {}));
    _performSearch();
  }
}