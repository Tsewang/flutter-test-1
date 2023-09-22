import 'package:flutter_application_3/data/repositories/auth_repo.dart';

import 'products_repo.dart';

class Repository {
  Repository({required this.productsRepo, required this.authRepo});

  final ProductsRepo productsRepo;
  final AuthRepo authRepo;
}
