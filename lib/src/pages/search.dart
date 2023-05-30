import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/pages/search/search_focus.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      //var gi = i % 3;
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(100) % 2 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
    print(groupBox); // 프린트 다르게 나온다
  }

  Widget _appbar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              // Get.to(SearchFocus());
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchFocus()));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xffefefef),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search),
                  Text(
                    '검색',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff838383),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: const Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      color: Colors.primaries[
                          Random().nextInt(Colors.primaries.length)]),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ).toList(),
            ),
          ),
        ).toList(),
      ),

      // children: [
      //   Expanded(
      //     child: Column(children: [
      //       Container(height: 280, color: Colors.green,),
      //       Container(height: 140, color: Colors.blue,),
      //
      //     ],),
      //   ),
      //   Expanded(
      //     child: Column(children: [
      //       Container(height: 140, color: Colors.blue,),
      //       Container(height: 140, color: Colors.red,),
      //
      //     ],),
      //   ),
      //   Expanded(
      //     child: Column(children: [
      //       Container(height: 140, color: Colors.grey,),
      //       Container(height: 140, color: Colors.blue,),
      //
      //     ],),
      //   ),
      //
      // ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('in Search() build!!!');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appbar(), // 일반 appbar로 하면 고정되서 따로 커스터마이징한 앱바 만듬
            Expanded(child: _body()),
          ],
        ),
      ),
    );
  }
}
