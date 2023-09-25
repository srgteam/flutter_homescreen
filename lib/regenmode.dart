import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_homescreen/variables_func.dart';
import 'package:flutter_homescreen/parkingmode.dart';
import 'package:flutter_homescreen/menubar.dart' ;
import 'package:flutter_homescreen/provider/count_provider.dart';

//import 'package:flutter_homescreen/parkingmode.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter_homescreen/menubar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_homescreen/powermode.dart';
import 'main.dart';
import 'package:intl/intl.dart';

class regenmode extends StatefulWidget {
  @override
  State<regenmode> createState() => _regenmode();
}

class _regenmode extends State<regenmode> {


  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body:Consumer<count_provider>(builder:(context, datafile, child){
        return  Center(
            child: Container(
          height: 600,
          width: 1024,
          decoration: BoxDecoration(
              color: Color(0xffF0FFFF),//Colors.black,//Color(0Xff323232),//Color(0Xff7FFFD4),0xffffdbac
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(0, 0),
                  bottomLeft: Radius.elliptical(0, 0),
                  topRight: Radius.elliptical(0, 0),
                  bottomRight: Radius.elliptical(0, 0)),
              border: Border.all(
                color:Color(0xffF0FFFF),
                width:2, //Color(0xffff6600),//Color(0xff38eeff),

              ),
              boxShadow: [
                BoxShadow(
                  blurRadius:11,
                  spreadRadius:11,
                  color:Colors.black26, //Color(0xffff6600),//Color(0xff38eeff),
                )
              ]),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    left == true
                        ? Image.asset(
                            'assets/images/left_green.png',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/left.png',
                            fit: BoxFit.cover,
                          ),
                    Container(
                      height: 70,
                      width: 600,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(400, 400),
                              bottomRight: Radius.elliptical(400, 400)),
                          border: Border.all(
                            color: Colors.black26, //Color(0xff38eeff),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: Colors.black26, //Color(0xff38eeff),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Column(
                          children: [
                            Text(
                              DateFormat('E d MMMM').format(DateTime.now()),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              DateFormat('HH:mm:ss').format(DateTime.now()),
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    right == true
                        ? Image.asset(
                            'assets/images/right_green.png',
                            fit: BoxFit.fill,
                          )
                        : Image.asset(
                            'assets/images/right.png',
                            fit: BoxFit.cover,
                          ),
                  ],
                ),
                SizedBox(height: 0),
                SizedBox(
                  height: 50,
                  width: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: parking_mode == true
                              ? Image.asset(
                                  'assets/images/parkingcolor.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/parking.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: highbeam == true
                              ? Image.asset(
                                  'assets/images/high-beam_blue.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/high-beam.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: hazard == true
                              ? Image.asset(
                                  'assets/images/colorhazardbg.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/hazard.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: headlamp == true
                              ? Image.asset(
                                  'assets/images/low-beam_green.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/low-beam.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 10),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: side_stand == true
                              ? Image.asset(
                                  'assets/images/colorside_standbg.png',
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/side_stand.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 0),
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Text(
                            (gearr != null )? gearr.toString():"N" ?? "0",
                            style: GoogleFonts.roboto(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: InkWell(
                        onTap: () {
                          currentScreenIndex=2;
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));
                        },
                        child: SizedBox(
                          height: 300,
                          child: IconButton(
                            onPressed: () {
                              currentScreenIndex=2;
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));
                            },
                            icon: Icon(
                              Icons.keyboard_double_arrow_left,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                      child: Center(
                        child: Container(
                          height: 350,
                          width: 800,
                          //here we are doing the box decoration
                          decoration: BoxDecoration(
                              color: Color(
                                  0xffeaeaea), //Color(0xffCCCCFF),//Color(0xff38eeff),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(800),
                                  bottomLeft: Radius.circular(800),
                                  topRight: Radius.elliptical(100, 100),
                                  bottomRight: Radius.elliptical(100, 100)),
                              border: Border.all(

                                    color:Color(0xffF0FFFF),
                                    width:2, //Color(0xff38eeff),

                              ),
                              boxShadow: [

                            BoxShadow(
                            blurRadius:11,
                            spreadRadius:11,
                            color:Colors.black26,
                          ) //Color(0xff38eeff),

                              ]),
                          //boxdecoration end

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SfRadialGauge(
                                enableLoadingAnimation: false,
                                animationDuration: 4500,
                                //
                                axes: <RadialAxis>[
                                  RadialAxis(
                                      minimum: 0,
                                      maximum: 200,
                                      isInversed: false,
                                      startAngle: 50, //240,//90
                                      endAngle: -50, //240,//-90
                                      interval: 10,
                                      showLabels: false,
                                      showTicks: false,
                                      ranges: <GaugeRange>[
                                        GaugeRange(
                                          startValue: 0,
                                          endValue: 40,
                                          color: Colors.orange,
                                          startWidth: 5,
                                          endWidth: 5,
                                        ),
                                        GaugeRange(
                                          startValue: 40,
                                          endValue: 70,
                                          color: Colors.orange,
                                          startWidth: 5,
                                          endWidth: 5,
                                        ),
                                        GaugeRange(
                                          startValue: 70,
                                          endValue: 140,
                                          color: Colors.orange,
                                          startWidth: 5,
                                          endWidth: 5,

                                        ),
                                        GaugeRange(
                                          startValue: 140,
                                          endValue: 200,
                                          color: Colors.orange,
                                          startWidth: 5,
                                          endWidth: 5,
                                        ),
                                      ],
                                      axisLineStyle: AxisLineStyle(thickness: 40),
                                      pointers: <GaugePointer>[

                                        RangePointer(
                                          value: (parsedSpeed != null && parsedSpeed! >= 200) ? 200 : (parsedSpeed ?? 0),
                                          width: 35,
                                          color: get_guage_color(),
                                          pointerOffset: 5,
                                        ),
                                        MarkerPointer(
                                          value: (parsedSpeed != null && parsedSpeed! >= 200) ? 200 : (parsedSpeed ?? 0),
                                          markerOffset: 3,
                                          markerWidth: 5,
                                          markerHeight: 35,
                                          color: Colors.white,
                                          borderWidth: 0,
                                        ) //Color(0xffFCD12A)get_guage_color()
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          widget: Text(
                                            "Regen",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFF7417)),
                                          ),
                                          angle: -90,
                                          positionFactor: 0.4,
                                        ),
                                        GaugeAnnotation(
                                          widget: Text(
                                            (parsedSpeed != null && parsedSpeed! >= 200)?"200":parsedSpeed.toString() ?? "0",
                                            style: TextStyle(
                                                fontSize: 60,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFF7417)),
                                          ),
                                          angle: -90,
                                          positionFactor: 0.1,
                                        ),
                                        GaugeAnnotation(
                                          widget: Text(
                                            "kmph",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black38),
                                          ),
                                          angle: 90,
                                          positionFactor: .4,
                                        ),
                                      ])
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, bottom: 0), //change
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.call,
                                            size: 40, color: Color(0xff323232)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 55.0),
                                          child: Icon(Icons.message,
                                              size: 40, color: Color(0xff323232)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 55.0),
                                          child: Icon(Icons.bluetooth,
                                              size: 40, color: Color(0xff323232)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 55.0),
                                          child: Icon(Icons.network_cell,
                                              size: 40, color: Color(0xff323232)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 55.0),
                                          child: Icon(
                                              Icons.battery_charging_full_sharp,
                                              size: 40,
                                              color: battery_color()),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 204,
                                      width: 420,
                                      color: Color(0xffeaeaea),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20.0),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              color: Color(0xffeaeaea),
                                              child: Icon(
                                                Icons.music_note,
                                                size: 100,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            songTitle,
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            Movie,
                                            style: TextStyle(
                                                fontSize: 16, color: Colors.grey),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.skip_previous),
                                                onPressed: () {
                                                  // Implement skip to previous logic
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.pause),
                                                onPressed: () {
                                                  // Implement pause logic
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.skip_next),
                                                onPressed: () {
                                                  // Implement skip to next logic
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width: 330,
                                            height: 100,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    right: 160,
                                                  ),
                                                  child: Text(
                                                    "DTE${fuelvalue*600}km",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black87),
                                                  ),
                                                ),
                                                Container(
                                                  height: 50,
                                                  child: LinearProgressIndicator(
                                                    value: fuelvalue,
                                                    valueColor:
                                                        AlwaysStoppedAnimation(
                                                            Color(0xffFCD12A)),
                                                    backgroundColor: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 20),
                                          child: Container(
                                              height: 50,
                                              width: 50,
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'assets/images/fuel-icon2.png'),
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20),
                                          child: Text(
                                            "${fuelvalue*100}0%" ,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: InkWell(
                        onTap: () {
                          currentScreenIndex=4;
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>parkingmode()));
                        },
                        child: SizedBox(
                            height: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    currentScreenIndex=4;
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>parkingmode()));
                                  },
                                  icon: Icon(
                                    Icons.keyboard_double_arrow_right,
                                    size: 80,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 600,
                  height: 30,
                  alignment: Alignment.center,
                  // Set the background color for the container
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [],
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0, left: 20),
                      child: Container(
                        width: 900, //1175
                        height: 40,

                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            border: Border.all(
                              color: Colors.black26, //Color(0xff38eeff),
                              width: 3,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                spreadRadius: 0,
                                color: Colors.white, //Color(0xff38eeff),
                              )
                            ]),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              (parsedSpeed != null && parsedSpeed! >= 200)?"Avg speed 200 km/h":"Avg speed ${speedD} km/h"??'0',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              (odometerr != null )? "ODO $odometerr km":"ODO 00000 km" ?? "0",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              (rpmr != null )? "Rpm $rpmr":"Rpm 00000" ?? "0",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Service $serviceDr",
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));},
      ),
    );
  }
}
