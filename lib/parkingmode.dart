//This dart file is for power mode

import 'package:flutter/material.dart';
import 'package:flutter_homescreen/variables_func.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_homescreen/menubar.dart';
import 'package:flutter_homescreen/main.dart';
import 'package:flutter_homescreen/regenmode.dart';
import 'package:flutter_homescreen/provider/count_provider.dart';
import 'package:provider/provider.dart';


class parkingmode extends StatefulWidget{

  @override

  State<parkingmode> createState() =>_parkingmode();



}
class _parkingmode extends State<parkingmode>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: Consumer<count_provider>(builder:(context, datafile, child)
        {
          return Center(
          child: Container(
            width: 1024,
            height: 600,
            color: Color(0xffF0FFFF),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [


                InkWell(onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => regenmode()));
                },
                  child: SizedBox(
                    height: 400,
                    child: IconButton(onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => regenmode()));
                    },
                      icon: Icon(Icons.keyboard_double_arrow_left, size: 80,
                        color: Colors.black26,),),
                  ),
                ),


                Column(
                  children: [
                    SizedBox(
                        height: 50
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //margin:const EdgeInsets.only(left:120.0),
                          height: 1,
                          width: 600,
                          decoration: BoxDecoration(
                              color: Color(0xffF0FFFF),
                              //borderRadius:BorderRadius.only(topLeft:Radius.circular(800),bottomLeft:Radius.circular(800),),
                              border: Border.all(
                                color: Color(0xffF0FFFF),
                                width: 2,

                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 11,
                                  spreadRadius: 11,
                                  color: Colors.black26,
                                )
                              ]
                          ),
                        )
                      ],
                    )
                    ,
                    SizedBox(
                      height: 50,
                    ),
                    Container(

                      //margin:const EdgeInsets.only(left:120.0),
                      height: 400,
                      width: 600,
                      decoration: BoxDecoration(
                          color: Color(0xffF0FFFF),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(70),
                              bottomLeft: Radius.circular(70),
                              topRight: Radius.circular(70),
                              bottomRight: Radius.circular(70)),
                          border: Border.all(
                            color: Color(0xffF0FFFF),
                            width: 2,

                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 11,
                              spreadRadius: 11,
                              color: Colors.black26,
                            )
                          ]
                      ),

                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                            child: Text("PARKING MODE", style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 70,
                            child: Column(
                              children: [
                                Icon(Icons.keyboard_double_arrow_up_rounded,
                                  color: Color(0xff00FFFF), size: 50,),
                                Text("Forward", style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),

                              ],
                            ),

                          ),

                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 120,
                            child: Column(
                              children: [
                                Expanded(flex: 3,
                                    child: Text("10", style: TextStyle(
                                        fontSize: 80,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),)),
                                Expanded(flex: 1,
                                    child: Text("km/h", style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),)),

                              ],
                            ),


                          ),

                          SizedBox(

                            height: 10,
                          ),
                          SizedBox(
                            height: 70,
                            child: Column(
                              children: [
                                Icon(Icons.keyboard_double_arrow_down_rounded,
                                  color: Color(0xff00FFFF), size: 50,),
                                Text("Reverse", style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),

                              ],
                            ),

                          ),
                        ],
                      ),

                    ),

                    SizedBox(
                      height: 50,
                    ),


                    //below meters


                    Row(
                      children: [
                        Container(
                          width: 600,
                          margin: EdgeInsets.only(left: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [

                              Text(
                                (parsedSpeed != null && parsedSpeed! >= 200)
                                    ? "Avg speed 200 km/h"
                                    : "Avg speed ${speedD} km/h" ?? '0',
                                style: TextStyle(fontSize: 15,
                                    fontWeight: FontWeight.bold),),

                              Text((odometerr != null )? "ODO $odometerr km":"ODO 00000 km" ?? "000000", style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),),

                              Text("Service $serviceDr", style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),)


                            ],
                          ),
                        )
                      ],


                    )
                  ],


                ),

                InkWell(onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => menubar()));
                },
                  child: SizedBox(
                    height: 400,
                    child: IconButton(onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => menubar()));
                    },
                      icon: Icon(Icons.keyboard_double_arrow_right, size: 80,
                        color: Colors.black26,),),
                  ),
                ),


              ],
            ),
          )
      );
    } ));

  }
}


