import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //ios风格
import 'home_page.dart';
import 'member_page.dart';
import 'cart_page.dart';
import 'category_page.dart';

class IndexPage extends StatefulWidget {
  // @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('我的')),
  ];

  final List tabBodies = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  int currentIndex = 0;
  var currentPage;//声明变量
  @override//切换初始化
  void initState() {
    currentPage = tabBodies[currentIndex];//默认页面
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(//脚手架设置页面底部导航栏背景颜色
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,//有多少图标
        onTap: (index){
          setState(() {//刷线页面
            currentIndex=index;
            currentPage=tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
