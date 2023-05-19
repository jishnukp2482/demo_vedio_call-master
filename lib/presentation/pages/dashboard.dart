import 'package:demo_vedio_call/presentation/manager/Homecontroller.dart';
import 'package:demo_vedio_call/presentation/routes/app_Pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/custompainter.dart';
import '../widgets/homegrid.dart';

class DashBoard extends StatelessWidget {
  DashBoard({super.key});
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: ListView(children: [
            Stack(children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: CustomPaint(
                      size: Size((MediaQuery.of(context).size.width ?? 0),
                              (MediaQuery.of(context).size.height ?? 0)) *
                          0.5,
                      painter: CurvePainterLogin(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, left: 16),
                                    child: Text(
                                      'Demo',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text(
                                  'Hi..User',
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  HomeGrid()
                ],
              ),
              Positioned(
                top: 10,
                right: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          controller.checkpermission();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/videocam.png"),
                              )),

                          //SvgPicture.asset("assets/video-chat-cam.svg"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/user.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.of(context).size.height * 0.26,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Icon(
                              Icons.account_balance_outlined,
                              color: Colors.deepPurple,
                            )),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Icon(
                              Icons.wallet,
                              color: Colors.deepPurple,
                            )),
                          )),
                          Card(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Icon(
                              Icons.attach_money_outlined,
                              color: Colors.deepPurple,
                            )),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.deepPurple,
          backgroundColor: Colors.white,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.logout), label: ""),
          ]),
    ));
  }
}
