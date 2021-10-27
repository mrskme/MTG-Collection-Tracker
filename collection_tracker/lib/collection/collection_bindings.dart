import 'package:get/get.dart';
import 'collection_controller.dart';

class ShowCollectionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CollectionController>(
      () => CollectionController(),
    );
  }
}
