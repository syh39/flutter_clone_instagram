import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

import '../../components/image_data.dart';

class SearchFocus extends StatefulWidget {
  const SearchFocus({Key? key}) : super(key: key);

  @override
  State<SearchFocus> createState() => _SearchFocusState();
}

class _SearchFocusState extends State<SearchFocus>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  Widget _tabmenuOne(String menu) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        menu,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }

  PreferredSizeWidget _tabMenu() {
    return PreferredSize(
      child: Container(
        height: AppBar().preferredSize.height,
        width: Size.infinite.width,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffe4e4e4)))),
        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.black,
          tabs: [
            _tabmenuOne('인기'),
            _tabmenuOne('계정'),
            _tabmenuOne('오디오'),
            _tabmenuOne('태그'),
            _tabmenuOne('장소'),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height),
    );
  }

  Widget _body() {
    return TabBarView(
      controller: tabController,
      children: const [
        Center(
          child: Text('인기 페이지'),
        ),
        Center(
          child: Text('계정 페이지'),
        ),
        Center(
          child: Text('오디오 페이지'),
        ),
        Center(
          child: Text('태그 페이지'),
        ),
        Center(
          child: Text('장소 페이지'),
        ),
      ], // 갯수에 맞게
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: BottomNavController.to.willPopAction,
            // {
            //   BottomNavController.to.willPopAction();
            //   // Get.find<BottomNavController>().willPopAction();
            // },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ImageData(IconsPath.backBtnIcon),
            )),
        titleSpacing: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: const Color(0xffefefef),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '검색',
              contentPadding: EdgeInsets.only(
                left: 15,
                top: 7,
                bottom: 7,
              ),
              isDense: true,
            ),
          ),
        ),
        bottom: _tabMenu(),
      ),
      body: _body(),
    );
  }
}
