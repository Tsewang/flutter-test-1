part of 'products_imports.dart';

class ProductsViewModel {
  final Repository repository;
  ProductsViewModel({required this.repository});

  static VelocityBloc<ProductsModel> productsModelBloc = VelocityBloc<ProductsModel>(ProductsModel());

  fetchAllProducts() async {
    var productsData = await repository.productsRepo.getAllProducts();
    productsModelBloc.onUpdateData(productsData);
  }
}
