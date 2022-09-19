import 'dart:convert';

import 'package:get/get.dart';
import 'package:innocence_baby/data/data.dart';

import '../model/api_response.dart';

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
    ClientModel client = ClientModel.fromJson(response.body);
    print("SUCCESS ${client.status}");
    return client;
    // final res = ApiResponse.fromJson(response.body);
    // var res = jsonDecode(response.body);
    if(response.status.hasError){
      return Future.error(response.status.hasError);
    }else{


    }
  }
}
