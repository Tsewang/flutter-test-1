import 'package:velocity_x/velocity_x.dart';

import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoint_urls.dart';

class ProductsRepo extends ApiClient {
  ProductsRepo();

  getAllProducts() async {
    try {
      final response = await getRequest(path: ApiEndpointUrls.products);
      if (response.statusCode == 200) {
        Vx.log(response.data);
      }
      return response;
    } on Exception catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      Vx.log(e);
    }
  }
}
