import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/route_manager.dart';
import 'package:mobileapp/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class bottmNavBar extends GetxController {
  var _currentIndex = 0.obs;
}

class MyApp extends StatelessWidget {
  final bNavbarController = Get.put(bottmNavBar());
  @override
  Widget build(BuildContext context) {
   
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Color(0xff1C2031),
              selectedFontSize: 14,
              selectedItemColor: Color(0xffff8f00),
              currentIndex: bNavbarController._currentIndex.value,
              onTap: (ind) {
                bNavbarController._currentIndex.value = ind;
              },
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/Icons/discover.svg"),
                    label: "Discover"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/Icons/chart.svg"),
                    label: "chart"),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset("assets/Icons/profile.svg"),
                    label: "Profile"),
              ]),
          body: HomePage()),
    );
  }
}
