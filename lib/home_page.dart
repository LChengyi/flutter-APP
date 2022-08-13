import 'package:flutter/material.dart';
import 'package:flutterproject1/login_page.dart';
import 'package:flutterproject1/demo.dart';
import 'package:flutterproject1/utils/icons.dart';

import 'package:flutterproject1/utils/navigation.dart';
import 'package:flutterproject1/comm.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void onIndexChanged(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      // 扩展到Scaffold的底部
      resizeToAvoidBottomInset: false,
      // 不允许键盘事件影响界面
      appBar: AppBar(
        //title: Text(widget.title),
      ),
      // PageController 控制 PageView 呈现页面
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onIndexChanged,
        children: const [
          DemoPage(title: "主页"),
          CommPage(),
          DemoPage(title: "发现"),
          DemoPage(title: "我的"),
        ],
      ),
      // 底部带凹下的导航
      bottomNavigationBar: BuildNavigation(
        currentIndex: currentIndex,
        items: [
          NavigationItemModel(
            label: "主页",
            icon: SvgIcon.layout,
          ),
          NavigationItemModel(
            label: "发现",
            icon: SvgIcon.position,
          ),
          NavigationItemModel(
            label: "消息",
            icon: SvgIcon.chat,
            count: 3,
          ),
          NavigationItemModel(
            label: "我的",
            icon: SvgIcon.user,
          ),
        ],
        onTap: onIndexChanged, // 切换tab事件
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_circle_rounded, size: 50),
      ),
      // 浮动按钮
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked, // 浮动按钮 停靠在底部中间位置
    );
  }
}

  // Widget build(BuildContext context) {
  //   final backButton = MaterialButton(
  //     minWidth: 10.0,
  //     height: 48.0,
  //     shape: const StadiumBorder(),
  //     onPressed: (){
  //       Navigator.of(context).pushNamed(LoginPage.tag);
  //     },
  //     color: Colors.lightBlueAccent,
  //     child: const Text('BACK',style: TextStyle(color: Colors.white),),
  //   );
  //   return Scaffold(
  //       backgroundColor: Colors.white,
  //       body: Center(
  //       child: Center(
  //       child: ListView(
  //       shrinkWrap: true,
  //       padding: const EdgeInsets.only(left: 24.0,right: 24.0),
  //   children:  <Widget>[backButton],),),)
  //   );
  // }

