part of 'home_imports.dart';

class HomeViewModel {
  final Repository repository;
  HomeViewModel({required this.repository});

  logout(context) async {
    var data = await repository.authRepo.userLogout(context);
    if (data.message.isNotEmptyAndNotNull) {
      Utils.clearAllSavedData();
      VxToast.show(context, msg: data.message.toString());
      AutoRouter.of(context).push(const AuthRoute());
      // AutoRouter.of(context).push(const AuthRoute());
    }
  }
}
