import 'package:get/get.dart';
import '../../data/api/api_client.dart';
import 'package:flutter/material.dart';

import '../../data/model/api_response.dart';
import '../../data/model/client.dart';
import '../../presentations/resources/routes_manager.dart';
import '../../presentations/widgets/snackbar_content.dart';
import '../shared_data.dart';

class AccountController extends GetxController with StateMixin<dynamic>{
  final ApiClient _apiClient;

  AccountController({required ApiClient client}) : _apiClient = client;

  RxString _phone = ''.obs;
  RxString _password = ''.obs;
  RxString _token = ''.obs;

  void logIn({required BuildContext context}) {
    change(null, status: RxStatus.loading());
    _apiClient.login(phone: name, password: password).then(
          (value) {
        ClientModel response = value;
        debugPrint(value.toString());
        String? tk = response.token;
        SharedData.setToken(tk!);
        var user = response.user;
        change(response, status: RxStatus.success());

        SnackbarContent.successSnackBar(
          context,
          response.status,
        );
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      },
    ).onError(
          (error, stackTrace) {
        change(error, status: RxStatus.error(error.toString()));
        SnackbarContent.errorSnackBar(
          context,
          error.toString(),
        );
      },
    );
  }
  String get userPhone => _phone.value;

  set name(String str) => _phone.value = str;
  set password(String str) => _password.value = str;

  String get name => _password.value;
  String get password => _password.value;

  void setToken() {
    SharedData.getToken().then((value) => _token.value = value);
  }

  String get token => "Bearer ${_token.value}";
}
