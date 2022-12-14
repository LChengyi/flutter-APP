
import 'dart:convert';
import 'package:flutterproject1/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject1/utils/dio_http.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController UserController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  _loginHandle() async{
    var name =UserController.text;
    var password =PasswordController.text;
    if (name == ''||password ==''){
      //记得写弹窗组件！！！commonToast.showToast();
      return;
      }
    const url = 'https://reqres.in/api/cupcakes';
    //const url ='https://tongxinshequ.cn/login';
    var params ={
      'username':name,
      'password':password,
    };
    var res = await DioHttp.of(context).post(url,params);
    print(res);
    var resMap = json.decode(res.toString());
    print(resMap);
    //String status = resMap['info'];
    // int status = resMap['status'];
    // String description = resMap['description'] ?? 'error';
    //if(status == '登录成功') {
    Navigator.of(context).pushNamed(HomePage.tag);
    //}
  }
  @override
  Widget build(BuildContext context) {
    final backGround = Container(
      height: 1000,
      width: 1000,
      decoration: const BoxDecoration(
        color: Colors.pinkAccent,
      ),
    );

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('assets/logo.png',),
      ),
    );

    final logintext =  Text(
      "登录",
      style: TextStyle(fontStyle:FontStyle.normal,fontSize: 35,fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );

    final email = TextFormField(
      controller: UserController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          hintText: '账号',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Colors.pinkAccent, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final password = TextFormField(
      controller: PasswordController,
      autofocus: false,
      obscureText: true,
      decoration:  InputDecoration(
          hintText: '密码',
          contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: const BorderSide(color: Colors.pinkAccent, width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0)
          )
      ),
    );

    final loginButton = MaterialButton(
          minWidth: 10.0,
          height: 60.0,
          shape: const StadiumBorder(),
          onPressed: (){
            _loginHandle();
          },
          color: Colors.pinkAccent,
          child: const Text('登 录',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        );

    const fronttext =  Text(
      "新用户？",
      style: TextStyle(fontStyle:FontStyle.normal,fontSize: 18),
      textAlign: TextAlign.center,
    );

    final register = TextButton(
      onPressed: (){},
      child: const Text('注册',style: TextStyle(color: Colors.pinkAccent,fontSize: 18),),
    );

     final forgetbutton = TextButton(
      onPressed: (){},
      child: const Text('忘记密码',style: TextStyle(color: Colors.grey,fontSize: 15),),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0,right: 24.0),
            children: <Widget>[
              logintext,
              const SizedBox(height: 24.0),
              email,
              const SizedBox(height: 12.0,),
              password,
              const SizedBox(height: 12.0,),
              loginButton,
              const SizedBox(height: 36.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  fronttext,
                  register,
                ],
              ),
              const SizedBox(height: 180.0,)
            ],
          ),
        ),
      ),
    );
  }
}
