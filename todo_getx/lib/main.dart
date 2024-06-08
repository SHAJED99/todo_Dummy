import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_getx/components.dart';
import 'package:todo_getx/src/controllers/data_controllers/data_controller.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(
    DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
    // const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      fontSizeResolver: (fontSize, instance) => fontSize.toDouble(),
      ensureScreenSize: true,
      designSize: baseScreenSize,
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        theme: theme(),
        darkTheme: theme(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        initialBinding: InitializedBinding(),
        scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
        }),
        home: child!,
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: setSafeAreaColor(context),
            child: child!,
          );
        },
      ),
      child: const SplashScreen(),
    );
  }
}

class InitializedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DataController());
  }
}
