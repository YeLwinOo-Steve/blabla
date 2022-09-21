import 'package:get/get.dart';
import 'package:innocence_baby/data/data.dart';
import 'package:innocence_baby/data/model/client_register.dart';
import '../../data/api/api_client.dart';
import 'package:flutter/material.dart';
import '../../data/model/client.dart';
import '../../presentations/auth/login.dart';
import '../../presentations/resources/routes_manager.dart';
import '../../presentations/widgets/snackbar_content.dart';
import '../shared_data.dart';

class AccountController extends GetxController with StateMixin<dynamic> {
  final ApiClient _apiClient;

  AccountController({required ApiClient client}) : _apiClient = client;

  RxString _phone = ''.obs;
  RxString _password = ''.obs;
  RxString _password_confirmation = ''.obs;
  RxString _token = ''.obs;
  RxString _name = ''.obs;

  void logIn({required BuildContext context}) {
    change(null, status: RxStatus.loading());
    _apiClient.login(phone: phone, password: password).then(
      (value) {
        ClientModel response = value;

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

  void register({required BuildContext context}) {
    change(null, status: RxStatus.loading());
    _apiClient
        .register(
      name: name,
      phone: phone,
      password: password,
      password_confirmation: passwordConfirmation,
    )
        .then(
      (value) {
        RegisterModel response = value;
        String? tk = response.token;
        var user = response.user;
        print(response.user);
        change(response, status: RxStatus.success());

        SnackbarContent.successSnackBar(
          context,
          response.success.toString(),
        );
        Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginView()));
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

  // void logout() {
  //   change(null, status: RxStatus.loading());
  //   _apiClient.(token: token).then((value) {
  //     ApiResponse response = value;
  //     removeUserData();
  //     change(response, status: RxStatus.success());
  //   }).onError((error, stackTrace) {
  //     change(error, status: RxStatus.error(error.toString()));
  //   });
  // }

  // void removeUserData() {
  //   SharedData.setToken('');
  //   SharedData.setUserPhone('');
  //
  // }

  set name(String str) => _name.value = str;

  set phone(String str) => _phone.value = str;

  set password(String str) => _password.value = str;

  set passwordConfirmation(String str) => _password_confirmation.value = str;

  String get phone => _phone.value;

  String get name => _name.value;

  String get password => _password.value;

  String get passwordConfirmation => _password_confirmation.value;

  void setToken() {
    SharedData.getToken().then((value) => _token.value = value);
  }

  String get token => "Bearer ${_token.value}";
}
