import 'package:flutter/material.dart';
import 'package:layananbk_flutter/page/addScedhulePage.dart';
import 'package:layananbk_flutter/page/historyPage.dart';
import 'package:layananbk_flutter/page/profilePage.dart';
import 'package:layananbk_flutter/page/scedhulePage.dart';
import 'package:layananbk_flutter/appTheme.dart';
import 'package:layananbk_flutter/components/bottomBarView.dart';
import 'package:layananbk_flutter/components/tabIconData.dart';
import 'package:layananbk_flutter/page/homePage.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

List<TabIconData> tabIconsList = TabIconData.tabIconsList;
AnimationController? animationController;

bool bottomNavBar = true;

Widget tabBody = Container(
  color: MyAppTheme.background,
);

class _ControllerPageState extends State<ControllerPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? topBarAnimation;
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  // List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  // AnimationController? animationController;

  // bool bottomNavBar = true;

  // Widget tabBody = Container(
  //   color: MyAppTheme.background,
  // );

  // late SharedPreferences preferences;
  // bool isLoading = false;

  // void getUserData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // void logout() {
  //   preferences.clear();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => const LoginPage()));
  // }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    tabBody = HomePage(animationController: animationController);

    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });

    super.initState();
    // getUserData();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Stack(
              children: <Widget>[
                tabBody,
                bottomBar()
                // bottomNavBar ? bottomBar() : getAppBarUI()
              ],
            );
          }
        },
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        // ElevatedButton(onPressed: logout, child: Text('Logout')),
        Column(
          children: <Widget>[
            bottomNavBar
                ? Container()
                : AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                        opacity: topBarAnimation!,
                        child: Transform(
                          transform: Matrix4.translationValues(
                              0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  MyAppTheme.white.withOpacity(topBarOpacity),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                              ),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: MyAppTheme.grey
                                        .withOpacity(0.4 * topBarOpacity),
                                    offset: const Offset(1.1, 1.1),
                                    blurRadius: 10.0),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: MediaQuery.of(context).padding.top,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 16 - 8.0 * topBarOpacity,
                                      bottom: 12 - 8.0 * topBarOpacity),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              // buttonClick,
                                              Container(
                                                  width: 35,
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(
                                                          255, 121, 164, 233),
                                                      gradient: LinearGradient(
                                                          colors: [
                                                            Color.fromARGB(255,
                                                                121, 164, 233),
                                                            Color.fromARGB(255,
                                                                101, 145, 211),
                                                          ],
                                                          begin:
                                                              Alignment.topLeft,
                                                          end: Alignment
                                                              .bottomRight),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  30))),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      animationController
                                                          ?.reverse()
                                                          .then<dynamic>(
                                                              (data) {
                                                        setState(() {
                                                        bottomNavBar = true;
                                                        tabBody = HomePage(
                                                            animationController:
                                                                animationController);
                                                        });
                                                      });
                                                      // Navigator.pushReplacement(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             ControllerPage()));
                                                    },
                                                    icon: Icon(Icons
                                                        .arrow_back_ios_new_rounded),
                                                    iconSize: 12,
                                                    color: Colors.white,
                                                  )),
                                              Text(
                                                'Tambah Jadwal',
                                                style: TextStyle(
                                                    color: Color(0xff0A2647),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              ),
                                              Container(
                                                width: 20,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
          ],
        ),
        const Expanded(
          child: SizedBox(),
        ),
        bottomNavBar
            ? BottomBarView(
                tabIconsList: tabIconsList,
                addClick: () {
                  bottomNavBar = false;
                  animationController?.reverse().then<dynamic>((data) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {
                      tabBody = AddScedhulePage(
                          animationController: animationController);
                    });
                  });
                },
                changeIndex: (int index) {
                  if (index == 0) {
                    animationController?.reverse().then<dynamic>((data) {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        tabBody =
                            HomePage(animationController: animationController);
                      });
                    });
                  } else if (index == 1) {
                    animationController?.reverse().then<dynamic>((data) {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        tabBody = ScedhulePage(
                            animationController: animationController);
                      });
                    });
                  } else if (index == 2) {
                    animationController?.reverse().then<dynamic>((data) {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        tabBody = HistoryPage(
                            animationController: animationController);
                      });
                    });
                  } else if (index == 3) {
                    animationController?.reverse().then<dynamic>((data) {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                        tabBody = ProfilePage(
                            animationController: animationController);
                      });
                    });
                  }
                },
              )
            : Container()
      ],
    );
  }

}
