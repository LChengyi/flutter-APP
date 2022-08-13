
import 'dart:convert';
import 'package:flutterproject1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject1/utils/dio_http.dart';

class CommPage extends StatefulWidget {
  static String tag = 'comm-page';
  const CommPage({Key? key}) : super(key: key);
  @override
  _CommPageState createState() => _CommPageState();
}
Textmaker(var textcon){
  final titext =  Text(
    textcon,
    style: TextStyle(fontStyle:FontStyle.normal,fontSize: 35,fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,
  );
  return titext;
}
class _CommPageState extends State<CommPage> {
  _ReadHandle() async{
  //const url = 'https://reqres.in/api/cupcakes';
  const url ='https://tongxinshequ.cn/test';
  var res = await DioHttp.of(context).post(url);
  //print(res.toString());
  //数据格式 id: 1, name: Gyf, date: 2022-07-04 18:56:36, text: So Hot!,
  //likeCount: 6, commentCount: 6, likedId: null, commentId: null, liked: true, followed: false
  if(jsonDecode(res.toString())['list'] == null)
    print("not catch!");
  else
   { List listuser = jsonDecode(res.toString())['list'];
     print(listuser[2]['text']);
    return listuser;}
  }
  // List _listuser=[];
  @override

  // void initState() {
  //   _ReadHandle().then((data) => setState(() {
  //     _listuser = data;
  //   }));
  //   super.initState();
  // }

  Widget build(BuildContext context) {

    final floatButton = FloatingActionButton(
        ///点击响应事
      onPressed: () async{
        await _ReadHandle();
        },
        ///长按提示
      tooltip: "刷新页面",
        ///设置悬浮按钮的背景
      backgroundColor: Colors.purpleAccent,
        ///获取焦点时显示的颜色
      focusColor: Colors.green,
        ///鼠标悬浮在按钮上时显示的颜色
      hoverColor: Colors.yellow,
        ///水波纹颜色
      splashColor: Colors.deepPurple,
        ///定义前景色 主要影响文字的颜色
      foregroundColor: Colors.black,
        ///配制阴影高度 未点击时
      elevation: 0.0,
        ///配制阴影高度 点击时
      highlightElevation: 20.0,

      child: const Text('刷新',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

    );
    //initState();
    return Scaffold(
        floatingActionButton: floatButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body:FutureBuilder(
          future: _ReadHandle(),
          builder:
              (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(slivers: <Widget>[
              //floatButton,
              SliverList(
              delegate: SliverChildListDelegate(
    //返回组件集合
    List.generate(50, (int index){
    //返回 组件
    return GestureDetector(
    onTap: () {
    print(snapshot.data[index]);
    },
    child: Card(
    child: Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.all(10),
    child:
    Textmaker(snapshot.data[index]['text']),
    ),
    ),
    );
    }),
    ),
    ),
    ],
    );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.only(top: 10),
              child: CircularProgressIndicator(
              strokeWidth: 8.0,
              )
              ); }
      }));}}


      // backgroundColor: Colors.white,
      // floatingActionButton: floatButton,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      // body: Center(
      //   child: Center(
      //     child: ListView(
      //       shrinkWrap: true,
      //       //padding: const EdgeInsets.only(left: 24.0,right: 24.0),
      //       children: <Widget>[
      //         //Textmaker(listuser[1]['text']),
      //         Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: <Widget>[
      //             fronttext,
      //             register,
      //           ],
      //         ),
      //         const SizedBox(height: 180.0,)
      //       ],
      //     ),
      //   ),
      // ),
//     );
//   }
// }