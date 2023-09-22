import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoint_urls.dart';
import '/presentation/screens/products/products_model.dart';

class ProductsRepo extends ApiClient {
  ProductsRepo();

  Future<ProductsModel> getAllProducts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.products);
      if (response.statusCode == 200) {
        final responseData = productsModelFromJson(jsonEncode(response.data[0]));
        // final responseData = ProductsModel.fromJson(response.data[0]);
        Vx.log(response.data);
        // Vx.log(responseData);
        return responseData;
      } else {
        ProductsModel();
      }
    } on Exception catch (e) {
      ProductsModel();
      Vx.log(e);
    }
    return ProductsModel();
  }
}
