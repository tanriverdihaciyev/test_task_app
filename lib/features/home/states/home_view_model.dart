import 'package:flutter/material.dart';
import '../../product/presentation/states/products/remote/remote_products_bloc.dart';
import '../../product/presentation/states/products/remote/remote_products_event.dart';
import '../../../injection_container.dart';

class HomeViewModel extends ChangeNotifier {
  String? _currentCategory;

  String? get currentCategory => _currentCategory;

  setCurrentCategory(String category) {
    if (category == _currentCategory) {
      _currentCategory = null;
      sl<RemoteProductsBloc>().add(GetProductsEvent());
      notifyListeners();
    } else {
      _currentCategory = category;
      sl<RemoteProductsBloc>().add(GetProductsInCategoryEvent(category));

      notifyListeners();
    }
  }

  fetch() {
    sl<RemoteProductsBloc>().add(currentCategory == null
        ? GetProductsEvent()
        : GetProductsInCategoryEvent(currentCategory!));
  }

  bool isSelected(String category) => category == _currentCategory;
}
