import 'package:get/get.dart';

import 'services/api_service.dart';

class AppBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<ApiService>(
      () async {
        return await ApiService();
      },
    );
  }
}
