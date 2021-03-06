import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_started/widgets/styledText_widget.dart';
import 'controllers/api_controller.dart';
import 'utils/utils.dart';
import 'controllers/page_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ApiController apiController = Get.find();
  @override
  void initState() {
    //apiController.getActiveCase().whenComplete(() => null);//fonksion tamamlandığında
    apiController.getActiveCase();
    apiController.getTotalDeaths();
    apiController.getTotalPatients();
    apiController.getTotalRecovered();
    apiController.getTotalTests();
    apiController.getAllCovidStats();

    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => PageControllerView(
            currentIndex: 0,
          ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: context.sizeW(1),
            height: context.sizeH(1),
            color: Colors.yellow.withOpacity(1),
          ),
          Container(
            child: SvgPicture.asset(
              'assets/svg/doctor-woman.svg',
              height: 500.0,
              width: 125.0,
            ),
          ),
          Positioned(
            top: 100,
            child: Container(
              child: StyledText(
                text: 'CoronApp+',
                color: Colors.redAccent,
                fontSize: 50,
                fontWeight: FontWeight.w900,
                fontFamily: 'Coda Caption',
              ),
            ),
          ),
          /* Positioned(
            bottom: 120,
            child: Container(
              child: CircularProgressIndicator(
                backgroundColor: Colors.redAccent,
                valueColor:
                    new AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
