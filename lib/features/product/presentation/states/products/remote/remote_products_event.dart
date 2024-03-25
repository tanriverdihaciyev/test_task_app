abstract class RemoteProductsEvent {}

class GetProductsEvent extends RemoteProductsEvent {
  GetProductsEvent();
}

class GetProductsInCategoryEvent extends RemoteProductsEvent {
  final String category;
  GetProductsInCategoryEvent(
    this.category,
  );
}
