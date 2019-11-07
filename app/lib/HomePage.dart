// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'RegisterPage.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>{

  final DatabaseReference DBRef = FirebaseDatabase.instance.reference();
  String _username;
  String _duration; 

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
                  height: ScreenUtil.getInstance().setHeight(359),
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
                        Text("Plant Name", style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        )),
                        TextField(
                          onChanged: (value){
                          setState(() {
                            _username = value;
                          });
                        },
                        decoration: InputDecoration(
                            hintText:"Plant Name",
                            hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                           )
                          )
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Text("Light Duration", style: TextStyle(
                          fontFamily: "Poppins-Medium",
                          fontSize: ScreenUtil.getInstance().setSp(30),
                        )),
                        TextField(
                          onChanged: (value){
                            setState(() {
                              _duration = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText:"Duration",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                            )
                          )
                        ),
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
                        onTap: () { writeDate(); },
                        child: Center(
                          child: Text("SEND DATA", style: TextStyle(
                            color:Colors.white,
                            fontFamily: "Poppins-Bold",
                            fontSize: 18.0,
                            letterSpacing: 1.5
                          )),
                        )
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

  void writeDate() {
    DBRef.child("1").set({
      'plantName' : _username,
      'timeDuration' : _duration
    });
  }
}