import 'dart:convert';
import 'package:get/get.dart';
import 'package:innocence_baby/data/data.dart';

import '../model/api_response.dart';
import '../model/client_register.dart';

class ApiClient extends GetConnect {
  final String url = 'https://innocence.apponlineshop.com/api/v1';
  late ApiResponse apiResponse;

  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = url;
  }

  //user login
  Future<ClientModel> login({
    required String phone,
    required String password,
  }) async {
    final body = {
      "phone": phone,
      "password": password,
    };

    final response = await post(
      '/auth/login',
      body,
    );
    print("RESPONSE ${response.statusCode}");
    if (response.statusCode == 200) {
      if (response.body["success"] == null) {
        return ClientModel.fromJson(response.body);
      } else {
        final res = ApiResponse.fromJson(response.body);
        return Future.error(res.error);
      }
    } else {
      return Future.error('Something Went Wrong');
    }
  }

  Future<RegisterModel> register({
    required String name,
    required String phone,
    required String password,
    required String password_confirmation,
  }) async {
    final body = {
      'name': name,
      'phone': phone,
      'password': password,
      'password_confirmation': password_confirmation,
    };
    print(body);
    final response = await post('/auth/register', body);

    print("RESPONSE ${response.statusCode}");
    if (response.statusCode == 200) {
      if (response.body["success"] == null) {
        print(response.body);
        return RegisterModel.fromJson(response.body);
      } else {
        final res = ApiResponse.fromJson(response.body);
        return Future.error(res.error);
      }
    } else {
      return Future.error('Something Wrong');
    }
  }
}
