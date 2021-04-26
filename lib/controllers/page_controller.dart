import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getx_started/utils/hexColor.dart';
import 'package:getx_started/views/pages/home/view/home_view.dart';

class PageControllerView extends StatefulWidget {
  var currentIndex;
  PageControllerView({@required this.currentIndex});
  @override
  _PageControllerViewState createState() => _PageControllerViewState();
}

class _PageControllerViewState extends State<PageControllerView> {
  @override
  Widget build(BuildContext context) {
    var bottomBarList = [
      {"cIndex": 0, "title": "Home", "icon": "home"},
      {"cIndex": 1, "title": "Search", "icon": "message"},
      {"cIndex": 2, "title": "Reels", "icon": "search"},
      {"cIndex": 3, "title": "Shop", "icon": "heart"},
      {"cIndex": 4, "title": "Profile", "icon": "profile"}
    ];
    List<Widget> pages = [
      HomeViewPage(),
      HomeViewPage(),
      HomeViewPage(),
      HomeViewPage(),
      HomeViewPage(),
    ];
    return Scaffold(
      body: Container(
        child: pages[widget.currentIndex],
      ),
      bottomNavigationBar: Container(
        color: HexColor("#402B4E"),
        height: 80,
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: bottomBarList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.currentIndex = bottomBarList[index]["cIndex"];
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 5.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/${bottomBarList[index]["icon"]}.svg',
                              height: 25.0,
                              width: 25.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
