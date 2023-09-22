import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import '../../presentation/screens/auth/login/login_model.dart';
import '../data_source/remote/api_client.dart';
import '../data_source/remote/api_endpoint_urls.dart';
import '../models/message_model.dart';

class AuthRepo extends ApiClient {
  AuthRepo();

  Future<LoginModel> userLogin(String email, String password, context) async {
    Map body = {
      "email": email,
      "password": password,
    };
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.login, body: body);
      if (response.statusCode == 200) {
        final responseData = loginModelFromJson(jsonEncode(response.data));
        // final responseData = LoginModel.fromJson(response.data);
        Vx.log(response.data);
        // Vx.log(responseData);
        return responseData;
      } else {
        LoginModel();
      }
    } on Exception catch (e) {
      LoginModel();
      VxToast.show(context, msg: e.toString());
    }
    return LoginModel();
  }

  Future<MessageModel> userLogout(context) async {
    try {
      final response =
          await postRequest(path: ApiEndpointUrls.logout);
      if (response.statusCode == 200) {
        final responseData = messageModelFromJson(jsonEncode(response.data));
        // final responseData = MessageModel.fromJson(response.data);
        Vx.log(response.data);
        // Vx.log(responseData);
        return responseData;
      } else {
        MessageModel();
      }
    } on Exception catch (e) {
      MessageModel();
      VxToast.show(context, msg: e.toString());
    }
    return MessageModel();
  }
}
