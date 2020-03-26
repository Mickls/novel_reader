import 'package:flutter/material.dart';
import '../component/home_screen.dart';
import '../component/book_screen.dart';
import '../component/person_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  @override
  _BottomNavigationBarWidgetState createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  static final _navigationBarColor = Color(0xFF737373);
  static final _activeNavigationBarColor = Color(0xFFFF0000);

  Color _homeFontColor = _activeNavigationBarColor;
  Color _bookFontColor = _navigationBarColor;
  Color _personFontColor = _navigationBarColor;

  int _currentIndex = 0;
  List<Widget> list = List();

  @override
  void initState() {
    list..add(HomeScreen())..add(BookScreen())..add(PersonScreen());
    super.initState(); //无名无参需要调用
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _navigationBarColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _activeNavigationBarColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(color: _homeFontColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                color: _navigationBarColor,
              ),
              activeIcon: Icon(
                Icons.book,
                color: _activeNavigationBarColor,
              ),
              title: Text(
                '书架',
                style: TextStyle(color: _bookFontColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: _navigationBarColor,
              ),
              activeIcon: Icon(
                Icons.person,
                color: _activeNavigationBarColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(color: _personFontColor),
              )),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFFF7F7F7),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (index==0){
              _homeFontColor = _activeNavigationBarColor;
              _bookFontColor = _navigationBarColor;
              _personFontColor = _navigationBarColor;
            }else if(index==1){
              _homeFontColor = _navigationBarColor;
              _bookFontColor = _activeNavigationBarColor;
              _personFontColor = _navigationBarColor;
            }else if(index==2){
              _homeFontColor = _navigationBarColor;
              _bookFontColor = _navigationBarColor;
              _personFontColor = _activeNavigationBarColor;
            }
          });
        },
      ),
    );
  }
}
