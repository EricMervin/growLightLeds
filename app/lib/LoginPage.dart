import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'RegisterPage.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget{
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Image.asset("images/image_01.png", color: Color.fromRGBO(255,255,255,0.6), colorBlendMode: BlendMode.modulate,),
              ),
              Expanded(
                child: Container(),
              ),
              Image.asset("images/image_02.png")
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
              child: Column(children: <Widget>[
                Row(children: <Widget>[
                  Image.asset(
                    "images/logo-1.png",
                    width: ScreenUtil.getInstance().setWidth(110),
                    height: ScreenUtil.getInstance().setHeight(110),
                  ),
                  Text("GROW LIGHT LEDs",
                      style: TextStyle(
                        fontFamily: "Poppins-Bold",
                        fontSize: ScreenUtil.getInstance().setSp(46),
                        letterSpacing: .6,
                      ),)
                ],),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(180),
                ),
                Container(
                  width: double.infinity,
                  height: ScreenUtil.getInstance().setHeight(459),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 15.0),
                        blurRadius: 15.0,
                      ),
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 10.0,
                      ),
                    ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("LOGIN", 
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(45),
                              fontFamily: "Poppins-Bold",
                              letterSpacing: .9
                        )),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Text("Username", style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        )),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _email = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your username",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 14.0,
                            )
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(20),
                        ),
                        Text("Password", style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        ),),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _password = value;
                            });
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Colors.grey, 
                              fontSize: 12.0,
                            )
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            InkWell(
                              child: 
                                Text("Not Registered Yet?",
                                  style: TextStyle(
                                    color: Colors.lightGreen,
                                    fontFamily: "Poppins-Medium",
                                    fontSize: ScreenUtil.getInstance().setSp(28)
                                  )),
                              onTap: () {
                                Navigator.of(context).pushNamed('/registerpage');
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(40),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: ScreenUtil.getInstance().setHeight(100),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xDD19A186),
                          Color(0xDDF2CF43)
                        ]
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFF2CF43).withOpacity(.3),
                          offset: Offset(0.0, 8.0),
                          blurRadius: 40.0
                        )
                      ]
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: (){
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email,
                            password: _password
                          ).then((user){
                            Navigator.of(context).pushReplacementNamed('/homepage');
                          }).catchError((e){
                            print(e);
                          });
                        },
                        child: Center(
                          child: Text("LOG IN", style:TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins-Bold",
                            fontSize: 18.0,
                            letterSpacing: 1.5
                          )),
                        ),
                      ),
                    ),
                  ),
                )
              ],),
            ),
          )
        ],
      ),
    );
  }
}