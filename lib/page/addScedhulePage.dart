import 'package:layananbk_flutter/components/home/formView.dart';
import 'package:layananbk_flutter/components/home/titleView.dart';
import 'package:layananbk_flutter/appTheme.dart';
import 'package:flutter/material.dart';

class AddScedhulePage extends StatefulWidget {
  const AddScedhulePage({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _AddScedhulePageState createState() => _AddScedhulePageState();
}

class _AddScedhulePageState extends State<AddScedhulePage>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

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
  }

  void addAllListData() {
    const int count = 5;

    listViews.add(
      Container(
        margin: EdgeInsets.only(top: 15),
        child: TitleView(
          titleTxt: 'Tipe Konseling',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
      ),
    );

    listViews.add(
      TipeView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      Container(
        margin: EdgeInsets.only(top: 15),
        child: TitleView(
          titleTxt: 'Topik Konseling',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
      ),
    );

    listViews.add(
      TopikView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      Container(
        margin: EdgeInsets.only(top: 15),
        child: TitleView(
          titleTxt: 'Tempat Konseling',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
      ),
    );

    listViews.add(
      TempatView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      Container(
        margin: EdgeInsets.only(top: 15),
        child: TitleView(
          titleTxt: 'Tanggal Konseling',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
      ),
    );

    listViews.add(
      TanggalView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      Container(
        margin: EdgeInsets.only(top: 15),
        child: TitleView(
          titleTxt: 'Waktu Konseling',
          subTxt: '',
          animation: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                  parent: widget.animationController!,
                  curve: Interval((1 / count) * 2, 1.0,
                      curve: Curves.fastOutSlowIn))),
          animationController: widget.animationController!,
        ),
      ),
    );

    listViews.add(
      WaktuView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      ButtonView(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 1, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  20,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

}
