import 'package:get/get.dart';
import '../data/api/api_client.dart';
import '../domain/controllers/account_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiClient());
    Get.lazyPut(
      () => AccountController(client: Get.find<ApiClient>()),
    );
  }
}
