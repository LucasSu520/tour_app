import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class mSwipper extends StatefulWidget {
  @override
  _mSwipperState createState() => _mSwipperState();
}

class _mSwipperState extends State<mSwipper> {
  List<String> imgList;

  @override
  void initState() {
    imgList = [
      'images/1.jpeg',
      'images/2.jpeg',
      'images/3.jpeg',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: imgList.length,
      autoplay: true,
      // viewportFraction: 0.8,
      // scale: 0.9,
      pagination: new SwiperPagination(),
      itemBuilder: (context, index) {
        return Image.asset(imgList[index],fit: BoxFit.cover,);
      },itemHeight: 60,);
  }
}
