import 'package:flutter/material.dart';
import 'package:tour_app/component/swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _opacity = 0;
  static const double APPBAR_SCROLL_OFFSET = 120;

  @override
  void initState() {
    this._opacity = 0;
    super.initState();
  }

  ScrollController _controller = new ScrollController();
  _onScroll(dynamic distance) {
    double alpha = 0.0;
    if (distance < 0) {
      alpha = 0.0;
    } else if (distance > APPBAR_SCROLL_OFFSET) {
      alpha = 1.0;
    } else {
      alpha = distance / APPBAR_SCROLL_OFFSET;
    }

    setState(() {
      this._opacity = alpha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: NotificationListener(
              // ignore: missing_return
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                controller: this._controller,
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  Container(
                    height: 200,
                    child: mSwipper(),
                  ),
                ],
              ),
            )),
        Opacity(
          opacity: this._opacity,
          child: Container(
            height: 80,
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
              child: Text(
                '多多',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
