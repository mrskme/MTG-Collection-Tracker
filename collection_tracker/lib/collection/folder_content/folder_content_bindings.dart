import 'package:get/get.dart';
import 'folder_content_controller.dart';

class FolderContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FolderContentController>(
      () => FolderContentController(),
    );
  }
}
