import 'dart:async';
import 'package:file_manager/core/util/screens.dart';
import 'package:file_manager/core/util/theme_config.dart';
import 'package:file_manager/presentation/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    systemUIConfig();
    super.initState();
  }

  init() {
    return Timer(const Duration(seconds: 2), handleNavigation);
  }

  void handleNavigation() async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      requestPermission();
    } else {
      Future.delayed(
        const Duration(seconds: 3),
        () => Screens.pushCompleteReplacement(context, const DashBoardScreen()),
      );
    }
  }

  void requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    if (status.isGranted) {
      Future.delayed(
        const Duration(seconds: 3),
        () => Screens.pushCompleteReplacement(context, const DashBoardScreen()),
      );
    } else {
      print("Please Grant Storage Permissions");
    }
  }

  void systemUIConfig() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Theme.of(context).primaryColor,
      systemNavigationBarColor: Colors.black,
      statusBarIconBrightness: Theme.of(context).primaryColor ==
              appThemeConfig[AppThemeKey.dark]!.primaryColor
          ? Brightness.light
          : Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(height: 20.0),
            Text(
              'File Manager',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
