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
  const regenmode({super.key});

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
              color: Colors.lightBlue.shade500,//Colors.black,//Color(0Xff323232),//Color(0Xff7FFFD4),0xffffdbac
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.elliptical(0, 0),
                  bottomLeft: Radius.elliptical(0, 0),
                  topRight: Radius.elliptical(0, 0),
                  bottomRight: Radius.elliptical(0, 0)),
              border: Border.all(
                color:Color(0xffF0FFFF),
                width:2, //Color(0xffff6600),//Color(0xff38eeff),

              ),
              boxShadow: const [
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
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.elliptical(400, 400),
                              bottomRight: Radius.elliptical(400, 400)),
                          border: Border.all(
                            color: Colors.black26, //Color(0xff38eeff),
                            width: 3,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 0,
                              spreadRadius: 0,
                              color: Colors.black26, //Color(0xff38eeff),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0,right:20),

                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(

                              DateFormat('EEE d MMM').format(DateTime.now())??'0',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),



                            SizedBox(
                              height:45,width:199,
                              child:Image.asset("assets/images/saracalogo2.png",fit:BoxFit.fill,alignment:Alignment.center,),
                            ),
                            Text(
                              DateFormat('HH:mm aa').format(DateTime.now())??'0',

                              style: const TextStyle(
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

                SizedBox(
                  height: 50,
                  width: 800,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
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
                        child: SizedBox(
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
                        child: SizedBox(
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
                        child: SizedBox(
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
                        child: SizedBox(
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
                        child: SizedBox(
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
                            icon: const Icon(
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
                              color: const Color(
                                  0xffeaeaea), //Color(0xffCCCCFF),//Color(0xff38eeff),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(800),
                                  bottomLeft: Radius.circular(800),
                                  topRight: Radius.elliptical(100, 100),
                                  bottomRight: Radius.elliptical(100, 100)),
                              border: Border.all(

                                    color:Colors.white,
                                    width:2, //Color(0xff38eeff),

                              ),
                              boxShadow: const [

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
                                      axisLineStyle: const AxisLineStyle(thickness: 40),
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
                                        const GaugeAnnotation(
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
                                            style: const TextStyle(
                                                fontSize: 60,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xffFF7417)),
                                          ),
                                          angle: -90,
                                          positionFactor: 0.1,
                                        ),
                                        const GaugeAnnotation(
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
                                        const Icon(Icons.call,
                                            size: 40, color: Color(0xff323232)),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(left: 55.0),
                                          child: Icon(Icons.message,
                                              size: 40, color: Color(0xff323232)),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(left: 55.0),
                                          child: Icon(Icons.bluetooth,
                                              size: 40, color: Color(0xff323232)),
                                        ),
                                        const Padding(
                                          padding:
                                              EdgeInsets.only(left: 55.0),
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













                                    ///here we will make the data about the tpms
                                    Container(
                                      height: 204,
                                      width: 420,

                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                "                          Front Tyre",
                                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10),
                                              // InfoItem(label: 'Pressure', value: '30 psi'), // Replace with actual values
                                              // InfoItem(label: 'Temperature', value: '25°C'), // Replace with actual values
                                              // InfoItem(label: 'Battery', value: '80%'), // Replace with actual values
                                              Padding(
                                                padding: const EdgeInsets.only(left:20.0),
                                                child: InfoItem(label: 'Pressure', value: (psi1 != null )? "             $psi1 psi":"00000 psi " ?? "0", icon: Icons.speed),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left:20.0),
                                                child: InfoItem(
                                                    label: 'Temperature', value: (temp1 != null )? "     $temp1 °C ":"00000 °C " ?? "0", icon: Icons.thermostat),
                                              ),//°C
                                              Padding(
                                                padding: const EdgeInsets.only(left:20.0),
                                                child: InfoItem(label: 'Battery', value:(tpms_battery != null )? "               $tpms_battery %":"00 % " ?? "0", icon: Icons.battery_full),
                                              ),
                                            ],
                                          ),

                                          // Icon(Icons.two_wheeler_outlined,size:40,),

                                          Padding(
                                            padding: const EdgeInsets.only(right:10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment:MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Text(
                                                      " Rear Tyre",
                                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                    ),

                                                  ],
                                                ),
                                                const SizedBox(height: 10),

                                                InfoItem(label: '', value: (psi2 != null )? "$psi2 psi":"00000 psi " ?? "0", ),
                                                InfoItem(
                                                  label: '', value: (temp2 != null )? "$temp2 °C ":"00000 °C " ?? "0", ),//°C
                                                InfoItem(label: '', value:(tpms_battery2 != null )? "$tpms_battery2 %":"00 % " ?? "0",),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: 330,
                                            height: 100,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    right: 160,
                                                  ),
                                                  child: Text(
                                                    "DTE ${fuelvalue*600}km"??'0',
                                                    style: const TextStyle(
                                                        fontSize: 24,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        color: Colors.black87),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(right:10),
                                                  child: SizedBox(
                                                    height: 50,
                                                    width:300,
                                                    child: LinearProgressIndicator(
                                                      value:fuelvalue ,///
                                                      valueColor:
                                                      const AlwaysStoppedAnimation(
                                                          Color(0xffFCD12A)),
                                                      backgroundColor: Colors.grey,
                                                    ),
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
                                          padding: const EdgeInsets.only(top: 20,right:25),
                                          child: Text(
                                            "${fuelLevelr*10}%"??'0' ,
                                            style: const TextStyle(
                                                fontSize: 17,
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
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
                        },
                        child: SizedBox(
                            height: 300,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    currentScreenIndex=4;
                                    Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
                                  },
                                  icon: const Icon(
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
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100)),
                            border: Border.all(
                              color: Colors.black26,
                              width: 3,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 0,
                                spreadRadius: 0,
                                color: Colors.white,
                              )
                            ]),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              (parsedSpeed != null && parsedSpeed! >= 200)?"Avg Speed 200 km/h":"Avg Speed $speedD km/h"??'0',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              (odometerr != null )? "ODO $odometerr km":"ODO 00000 km" ?? "0",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              (rpmr != null )? "RPM $rpmr":"RPM 00000" ?? "0",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Service $serviceDr",
                              style: const TextStyle(
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











class InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData? icon;

  const InfoItem({
    Key? key,
    required this.label,
    required this.value,
     this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 20,
                color: Colors.blue,
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}









