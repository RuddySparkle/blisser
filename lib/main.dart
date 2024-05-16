import 'package:blisser/pages/account.dart';
import 'package:blisser/pages/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // ignore: deprecated_member_use
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Blisser v0.1.0',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          fontFamily: 'LibreBaskerville',
        ),
        home: const HomePage(),
        routes: Map<String, WidgetBuilder>.from({
          '/account': (context) => const AccountPage(),
        }));
  }
}
