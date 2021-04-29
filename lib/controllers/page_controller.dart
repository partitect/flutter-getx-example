import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getx_started/utils/hexColor.dart';
import 'package:getx_started/views/pages/daily/view/daily_view.dart';
import 'package:getx_started/views/pages/home/view/home_view.dart';
import 'package:getx_started/widgets/styledText_widget.dart';

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
      {"cIndex": 0, "title": "Home", "icon": "corona"},
      {"cIndex": 1, "title": "Search", "icon": "patient"}
    ];
    List<Widget> pages = [HomeViewPage(), DailyViewScreen()];
    return Scaffold(
      appBar: AppBar(
        title: StyledText(
          text: "CoronApp+",
          fontSize: 26,
          fontWeight: FontWeight.w900,
        ),
        centerTitle: false,
        brightness: Brightness.dark,
        backgroundColor: Colors.purple,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svg/Turkey.svg',
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
                ),
                StyledText(
                  text: "Turkey",
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: pages[widget.currentIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          gradient: LinearGradient(
            end: Alignment.bottomLeft,
            begin: Alignment.bottomRight,
            colors: [Colors.purple, Colors.pink],
          ),
        ),
        height: 80,
        padding: EdgeInsets.only(bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              'assets/svg/${bottomBarList[index]["icon"]}.svg',
                              height: 55.0,
                              width: 55.0,
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
