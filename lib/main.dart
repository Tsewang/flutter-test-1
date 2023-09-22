import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constants/my_colors.dart';
import 'package:flutter_application_3/data/repositories/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/my_strings.dart';
import 'core/themes/app_themes.dart';
import 'data/repositories/products_repo.dart';
import 'data/repositories/repository.dart';
import 'presentation/router/router_imports.dart';

void main() {
  runApp(RepositoryProvider(
    create: (context) => Repository(
      productsRepo: ProductsRepo(),
      authRepo: AuthRepo(),
    ),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 845),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, chil) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: MyStrings.appName,
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: MyColors.primaryColor),
                useMaterial3: true),
            darkTheme: AppThemes.dark,
            routerConfig: _appRouter.config(),
          );
        });
  }
}
