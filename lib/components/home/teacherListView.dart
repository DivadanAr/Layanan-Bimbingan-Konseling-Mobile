import 'package:layananbk_flutter/appTheme.dart';
import 'package:layananbk_flutter/components/home/teacherListData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TeacherListView extends StatefulWidget {
  const TeacherListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _TeacherListViewState createState() => _TeacherListViewState();
}

class _TeacherListViewState extends State<TeacherListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<TeacherListData> teacherListData = TeacherListData.tabIconsList;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: teacherListData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final int count =
                      teacherListData.length > 10 ? 10 : teacherListData.length;
                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return TeacherView(
                    teacherListData: teacherListData[index],
                    animation: animation,
                    animationController: animationController!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class TeacherView extends StatelessWidget {
  const TeacherView(
      {Key? key,
      this.teacherListData,
      this.animationController,
      this.animation})
      : super(key: key);

  final TeacherListData? teacherListData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                100 * (1.0 - animation!.value), 0.0, 0.0),
            child: SizedBox(
              width: 130,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 32, left: 8, right: 8, bottom: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: HexColor(teacherListData!.endColor)
                                  .withOpacity(0.6),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                        gradient: LinearGradient(
                          colors: <HexColor>[
                            HexColor(teacherListData!.startColor),
                            HexColor(teacherListData!.endColor),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(54.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 54, left: 14, right: 16, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              teacherListData!.titleTxt,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: MyAppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                letterSpacing: 0.2,
                                color: MyAppTheme.white,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      teacherListData!.moto!.join('\n'),
                                      style: TextStyle(
                                        fontFamily: MyAppTheme.fontName,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 9,
                                        letterSpacing: 0.2,
                                        color: MyAppTheme.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // teacherListData?.title != ''
                            //     ? Text(
                            //       teacherListData!.title.toString(),
                            //       textAlign: TextAlign.center,
                            //       style: TextStyle(
                            //         fontFamily: MyAppTheme.fontName,
                            //         fontWeight: FontWeight.w500,
                            //         fontSize: 13,
                            //         letterSpacing: 0.2,
                            //         color: MyAppTheme.white,
                            //       ),
                            //     )
                            //     :
                            // Container(
                            //     decoration: BoxDecoration(
                            //       color: MyAppTheme.nearlyWhite,
                            //       shape: BoxShape.circle,
                            //       boxShadow: <BoxShadow>[
                            //         BoxShadow(
                            //             color: MyAppTheme.nearlyBlack
                            //                 .withOpacity(0.4),
                            //             offset: Offset(8.0, 8.0),
                            //             blurRadius: 8.0),
                            //       ],
                            //     ),
                            //     child: Row(
                            //       children: [
                            //         Text('Detail'),
                            //         Icon(
                            //           Icons.add,
                            //           color: HexColor(teacherListData!.endColor),
                            //           size: 24,
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            SizedBox(
                              height: 25,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.all(0),
                                      primary: Colors.white,
                                      onPrimary: Colors.white,
                                      backgroundColor: Colors.white),
                                  onPressed: () {
                                    Alert(
                                        context: context,
                                        content: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Stack(
                                              children: [
                                                Positioned(
                                                    child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 12.5, left: 5),
                                                  padding: EdgeInsets.only(
                                                      left: 85,
                                                      right: 30,
                                                      top: 10,
                                                      bottom: 10),
                                                  decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Color(0xffA1C2F1),
                                                          Color.fromARGB(
                                                              255, 87, 146, 223)
                                                        ], // Warna-warna gradient
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        teacherListData!
                                                                    .title !=
                                                                'Pria'
                                                            ? 'Mr.s ' +
                                                                teacherListData!
                                                                    .titleTxt
                                                            : 'Mr. ' +
                                                                teacherListData!
                                                                    .titleTxt,
                                                        style: GoogleFonts.quicksand(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700)),
                                                      ),
                                                      Text(
                                                        teacherListData!
                                                            .spesialis,
                                                        style: GoogleFonts.quicksand(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                                SizedBox(
                                                  width: 80,
                                                  height: 80,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(100),
                                                        border: Border.all(
                                                            width: 5,
                                                            color:
                                                                Colors.white)),
                                                    child: Image.asset(
                                                        teacherListData!
                                                            .imagePath),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                  teacherListData!.desk,
                                                  style: GoogleFonts.quicksand(
                                                      textStyle: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black45)),
                                                ))
                                          ],
                                        ),
                                        buttons: []).show();
                                  },
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Detail',
                                            style: GoogleFonts.quicksand(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          )),
                                      Icon(
                                        Icons.arrow_right,
                                        color: Colors.black,
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 84,
                      height: 84,
                      decoration: BoxDecoration(
                        color: MyAppTheme.nearlyWhite.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 8,
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.asset(teacherListData!.imagePath),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
