//importing all the required package
//Null runtime issue resolved
import 'dart:async';                                               //for asyncronous or timer related functions
import 'package:flutter/material.dart';                           //all the ui related widgets
import 'package:google_fonts/google_fonts.dart';                 //for google fonts
import 'package:intl/intl.dart';                                //for date format
import 'package:syncfusion_flutter_gauges/gauges.dart';        //for radial gauges
import 'package:provider/provider.dart';                      //for state management


//user defined files


import 'package:flutter_homescreen/variables_func.dart';
import 'package:flutter_homescreen/splashscreen.dart';
import 'package:flutter_homescreen/regenmode.dart';
import 'package:flutter_homescreen/parkingmode.dart';
import 'package:flutter_homescreen/menubar.dart' ;
import 'package:flutter_homescreen/powermode.dart';
import 'package:flutter_homescreen/provider/count_provider.dart';


//end of user defined files



//main function
void main() {


  runApp(MyApp());
}

////end of Main function

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override

  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create:(_)=>count_provider())],
      child:   MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,


        //Setting the pages routes
        routes: {
          '/': (context) =>  splash_screen(),
          '/first':(context)=>MyHomePage(),
          '/second': (context) => powermode(),
          '/third': (context) => regenmode(),
          '/fourth': (context) => parkingmode(),
          '/fifth': (context) => menubar(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),);

  }
}





class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {




  @override
  initState()   {
    super.initState();


   
    // Delay execution until the splash screen is complete
   
    final countprovider = Provider.of<count_provider>(context, listen: false);



      if (context != null && countprovider != null) {
        mythreadfunc();
        
        
        Timer.periodic(Duration(milliseconds: 50), (timer) {
          countprovider.loadGaugeValues();
        });
      }

  }

//end of init state function

// Dispose:used to cancel the timer

  @override
  void dispose() {
    timer?.cancel();
    timer1?.cancel();
    timer2?.cancel();
    super.dispose();
  }



  //End of pop function

  @override
  Widget build(BuildContext context) {
    final countprovider=Provider.of<count_provider>(context,listen:false);

    return Scaffold(
      body: Consumer<count_provider>(builder:(context, datafile, child) {

        return Center(
            child: Container(
              height: 600,
              width: 1024,
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade900, //Color(0xffF8F8F8)

                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(0, 0),
                      bottomLeft: Radius.elliptical(0, 0),
                      topRight: Radius.elliptical(0, 0),
                      bottomRight: Radius.elliptical(0, 0)),
                  border: Border.all(
                    color: Colors.black26, //Color(0xff38eeff),
                    width: 3,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 11,
                      spreadRadius: 11,
                      color: Colors.white, //Color(0xff38eeff),
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
                          'assets/images/colorleftwhite.png',
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



                                Container(
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
                          'assets/images/right_white.png',
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    const SizedBox(height: 0),
                    SizedBox(
                      height: 50,
                      width: 800,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: 50,  //actual size was 40 height width for all indicators
                              width: 50,
                              child: parking_mode == true
                                  ? Image.asset(
                                'assets/images/parkingcolor.png',
                                fit: BoxFit.cover,
                              )
                                  : Image.asset(
                                'assets/images/parking_white.png',
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
                                'assets/images/high-beam_white.png',
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
                                'assets/images/hazard_white.png',
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
                                'assets/images/low-beam_white.png',
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
                                'assets/images/side_stand_white.png',
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
                                  color: Colors.grey.shade500,
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
                          padding: const EdgeInsets.only(left: 110.0, top: 20.0),
                          child: Center(
                            child: Container(
                              height: 350,
                              width: 800,
                              //here we are doing the box decoration
                              decoration: BoxDecoration(
                                  color: Colors
                                      .white, //Color(0xffCCCCFF),//Color(0xff38eeff),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(800),
                                      bottomLeft: Radius.circular(800),
                                      topRight: Radius.elliptical(100, 100),
                                      bottomRight: Radius.elliptical(100, 100)),
                                  border: Border.all(
                                    color: Colors.white, //Color(0xff38eeff),
                                    width: 2,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 11,
                                      spreadRadius: 11,
                                      color: Colors.black26, //Color(0xff38eeff),
                                    )
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
                                          startAngle:
                                          50, //240,//90  //for now 7/24/2023 50
                                          endAngle:
                                          -50, //240,//-90  //for now 7/24/2023 -50
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
                                          axisLineStyle: const AxisLineStyle(
                                              thickness: 40,
                                              color:
                                              Colors.black12), //Color(0xffEC5800)

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
                                            //MarkerPointer(value:value,markerOffset:35,markerWidth:40,markerType: MarkerType.image,markerHeight:50,color:get_guage_color(),borderWidth:0,imageUrl:"assets/images/bike_blue.png",)//Color(0xffFCD12A)                //0xff0FFF50 for eco mode
                                          ],
                                          annotations: <GaugeAnnotation>[
                                            const GaugeAnnotation(
                                              widget: Text(
                                                "ECO",
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
                                            Container(
                                              alignment:Alignment.topLeft,
                                              height:40,width:80,
                                              child: const Icon(Icons.call,
                                                  size: 40, color: Color(0xff323232)),
                                            ),
                                            const Padding(
                                              padding:
                                              EdgeInsets.only(left: 15.0),
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
                                        Container(
                                          height: 204,
                                          width: 420,
                                          color: Colors.white,
                                           child:  Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                             crossAxisAlignment:CrossAxisAlignment.center,
                                             children: [
                                               Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                 mainAxisAlignment:MainAxisAlignment.center,
                                                 children: [
                                                   const Text(
                                                     "                                Front Tyre",
                                                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                   ),
                                                   const SizedBox(height: 10),
                                                   // InfoItem(label: 'Pressure', value: '30 psi'), // Replace with actual values
                                                   // InfoItem(label: 'Temperature', value: '25°C'), // Replace with actual values
                                                   // InfoItem(label: 'Battery', value: '80%'), // Replace with actual values
                                                   Padding(
                                                     padding: const EdgeInsets.only(left:20.0),
                                                     child: InfoItem(label: 'Pressure', value: (psi1 != null )? "               $psi1 psi":"00000 psi " ?? "0", icon: Icons.speed),
                                                   ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left:20.0),
                                                     child: InfoItem(
                                                         label: 'Temperature', value: (temp1 != null )? "     $temp1 °C ":"00000 °C " ?? "0", icon: Icons.thermostat),
                                                   ),//°C
                                                   Padding(
                                                     padding: const EdgeInsets.only(left:20.0),
                                                     child: InfoItem(label: 'Battery', value:(tpms_battery != null )? "                 $tpms_battery %":"00 % " ?? "0", icon: Icons.battery_full),
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
                                                           "Rear Tyre",
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
                                                        right: 100,
                                                      ),
                                                      child: Text(
                                                        "Fuel Range ${fuelvalue*600}km"??'0',
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
                              currentScreenIndex=2;
                              Navigator.of(context).pushReplacementNamed('/second');
                            },
                            child: SizedBox(
                                height: 300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        currentScreenIndex=2;
                                        Navigator.of(context).pushReplacementNamed('/second');
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));
                                      },
                                      icon: const Icon(
                                        Icons.keyboard_double_arrow_right,
                                        size: 80,
                                        color: Colors.grey,
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
                    const SizedBox(
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
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                    topRight: Radius.circular(100),
                                    bottomRight: Radius.circular(100)),
                                border: Border.all(
                                  color: Colors.grey, //Color(0xff38eeff),
                                  width: 3,
                                ),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 0,
                                    spreadRadius: 0,
                                    color: Colors.grey, //Color(0xff38eeff),
                                  )
                                ]),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  (parsedSpeed != null && parsedSpeed! >= 200)?"Avg Speed 200 km/h":"Avg Speed ${speedD} km/h"??'0',
                                  style: const TextStyle(   //previous GoogleFonts.roboto
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
                                  "Service $serviceD"??'0',
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
            ));

      }),


    );
  }



  //page changes
  int switch_screen_lock=0;
  void choose_screen()
  {
    if(currentScreenIndex==1 && last_mode!=1)
    {
      last_mode=1;
      if(move=='2')
      {
        currentScreenIndex=4;
        //Navigator.pushNamed(context, '/Second');
        //Navigator.push(context,MaterialPageRoute(builder: (context)=>menubar()));

      }
      else if(move=='3')
      {
        currentScreenIndex=2;
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));

      }
      else{
        currentScreenIndex=currentScreenIndex;
        move='4';
      }
    }

    //////////////////////////////////////////////

    else if(currentScreenIndex==2  && last_mode!=2)
    {

      last_mode=1;
      if(move=='2')
      {
        currentScreenIndex=1;
        //Navigator.pushNamed(context, '/Second');
        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));

      }
      else if(move=='3')
      {
        currentScreenIndex=3;
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>regenmode()));

      }

      else{
        currentScreenIndex=currentScreenIndex;
        move='4';
      }
    }

    /////////////////////////////////

    else if(currentScreenIndex==3  && last_mode!=3)
    {
      last_mode=3;
      if(move=='2')
      {
        currentScreenIndex=2;
        //Navigator.pushNamed(context, '/Second');
        // Navigator.push(context,MaterialPageRoute(builder: (context)=>powermode()));

      }
      else if(move=='3')
      {
        currentScreenIndex=4;
        //  Navigator.push(context,MaterialPageRoute(builder: (context)=>menubar()));

      }

      else{
        currentScreenIndex=currentScreenIndex;
        move='4';
      }
    }

    /////////////////////////////////

    else if(currentScreenIndex==4  && last_mode!=4)
    {
      last_mode=4;
      if(move=='2')
      {
        currentScreenIndex=3;
        //Navigator.pushNamed(context, '/Second');
        //  Navigator.push(context,MaterialPageRoute(builder: (context)=>regenmode()));

      }
      else if(move=='3')
      {
        currentScreenIndex=1;
        Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));

      }

      else{
        currentScreenIndex=currentScreenIndex;
        move='4';



      }
    }






  }




//mode change function
  void switch_mode()
  {
    if(modeDr=='1' && last_mode!=1)
    {
      currentScreenIndex=1;
      Navigator.of(context).pushReplacementNamed('/first');
      last_mode=1;
    }
    else if(modeDr=='2' && last_mode!=2 )
    {

      currentScreenIndex=2;
      Navigator.of(context).pushReplacementNamed('/second');
      last_mode=2;
    }
    else if(modeDr=='3'  && last_mode!=3)
    {

      currentScreenIndex=3;
      Navigator.of(context).pushReplacementNamed('/third');
      last_mode=3;
    }

    else{
      last_mode=0;
    }

  }







































///////////////////////////////////////////////////////
}
