import 'package:flutter/material.dart';
import 'package:tour_app/pages/categoryPage.dart';
import 'package:tour_app/pages/homePage.dart';
import 'package:tour_app/pages/myPage.dart';
import 'package:tour_app/pages/searchPage.dart';

class mBottomNavigator extends StatefulWidget {
  @override
  _mBottomNavigatorState createState() => _mBottomNavigatorState();
}

class _mBottomNavigatorState extends State<mBottomNavigator> {
  List<Widget> _list = [HomePage(), CategoryPage(), SearchPage(), MyPage()];

  int _currentIndex;

  @override
  void initState() {
    _currentIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: this._list[this._currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: '搜索'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
          ],
          onTap: (index) => {
            setState(() {
              _currentIndex = index;
            })
          },
        ));
  }
}
