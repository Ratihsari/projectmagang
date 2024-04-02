// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/app/controllers/auth_controller.dart';
// import 'package:flutter_application_2/app/modules/home/views/home_view.dart';
// import 'package:flutter_application_2/app/modules/login/views/login_view.dart';
// import 'package:flutter_application_2/app/modules/home/views/home_view.dart';
// import 'package:flutter_application_2/app/modules/login/views/login_view.dart';
import 'package:flutter_application_2/app/utils/loading.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

late final FirebaseApp app;
late final FirebaseAuth main_auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:
          "AIzaSyCx8DcCz-H kZtcFZY2otWg_L2Tlbc56CH0", // tempelkan kunci api Anda di sini
      appId:
          "1:1007795885830:android:9142bee80d304c6396f087", //tempelkan id aplikasi Anda di sini
      messagingSenderId:
          "1007795885830", //tempelkan messageSenderId Anda di sini
      projectId: "magang-firebase", //tempel proyek Anda ID di sini
    ),
  );
  main_auth = FirebaseAuth.instanceFor(app: app);
  // final authC = Get.put(AuthController(), permanent: true);
  // await Firebase.initializeApp();
  FirebaseAuth.instance;
  final authC = Get.put(AuthController(), permanent: true);

  runApp(MyApp());
}
// final authC = Get.put(AuthController(), permanent: true);

class MyApp extends StatelessWidget {
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          print(snapshot.data);

          return GetMaterialApp(
            title: "Application",
            initialRoute:
                snapshot.data != null && snapshot.data!.emailVerified == true
                    ? Routes.HOME
                    : Routes.LOGIN,
            getPages: AppPages.routes,
            // home: snapshot.data != null ? HomeView( ) : LoginView(),
          );
        }
        return loadingView();
      },
    );
  }
}
