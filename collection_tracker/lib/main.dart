import 'dart:convert';
//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:collection_tracker/theme/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app-bindings.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async {
  // await AppBindings().dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Color(0xFF141414),
      ),
    );
    return GetMaterialApp(
      theme: AppTheme.buildAppTheme(),
      title: "test 123",
      debugShowCheckedModeBanner: false,
      initialRoute: Paths.homeMain,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
    );
  }
}

// class HomePage extends GetView<HomePageController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: const Center(
//         child: const TextButton(
//           child: Text("hoho"),
//           onPressed: fetchCards,
//         ),
//       ),
//     );
//   }
// }
