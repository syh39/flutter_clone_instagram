import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_instagram/src/pages/active_history.dart';
import 'package:flutter_clone_instagram/src/pages/home.dart';
import 'package:flutter_clone_instagram/src/pages/mypage.dart';
import 'package:flutter_clone_instagram/src/pages/search.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
          () => Scaffold(
            body: IndexedStack(
              index: controller.pageIndex.value,
              children: [
                const Home(),
                Navigator(
                  key : controller.searchPageNavigationKey,
                  onGenerateRoute: (routeSetting) {
                    return MaterialPageRoute(builder: (context) => const Search(),);
                  },
                ),
                // const Search(),
                Container(),
                const ActiveHistory(),

                const MyPage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              // active되도 아이콘 안움직임
              showSelectedLabels: false,
              showUnselectedLabels: false,
              // 라벨 없애기
              currentIndex: controller.pageIndex.value,
              elevation: 0,
              onTap: controller.changeBottomNav, // 원래 onTap : (value) {} 임. 이렇게 선언하면 changeBottomNav(value)로 인자가 넘어감.
              // getX로 관리한다
              items: [
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.homeOff),
                  activeIcon: ImageData(IconsPath.homeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.searchOff),
                  activeIcon: ImageData(IconsPath.searchOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.uploadIcon),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: ImageData(IconsPath.activeOff),
                  activeIcon: ImageData(IconsPath.activeOn),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      )),
                  label: 'home',
                ),
              ],
            ),
          ),
        ),
        onWillPop: controller.willPopAction,
    );
  }
}
