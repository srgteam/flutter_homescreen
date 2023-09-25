
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/variables_func.dart';

class count_provider extends ChangeNotifier{




  ///////////////////////////////
   Future<void> loadGaugeValues() async {
     try {



         String line = rawdata.toString();




         //    await Future.delayed(const Duration(milliseconds: 1));


         if (line.isNotEmpty && line.startsWith('*E') && line.endsWith('K#') && line!=null ) {
           rpmD = line.substring(2, 7);
           // print('rpm is $rpmD');
           speedD = line.substring(8, 11);     //replaceAll(" ", "");

           // print('speed is $speedD');
           fuelLevelD = line.substring(12, 13);
           //print('fuel level is $fuelLevelD');

           odometerD = line.substring(14, 20);
           //print('odo meter rating is $odometerD');
           headLampD = line.substring(21, 22);
           // print('headlamp status is $headLampD');
           gearD = line.substring(23, 24) ?? 'N';
           // print('gear status is $gearD');
           leftIndicatorD = line.substring(25, 26);
           // print('left indicator status is $leftIndicatorD');
           rightIndicatorD = line.substring(27, 28);
           //print('right indicator status is $rightIndicatorD');
           modeD = line.substring(29, 30);
           // print('mode status is $rightIndicatorD');
           serviceD = line.substring(31, 32);
           // print('serviceD status is $serviceD');
           batteryD = line.substring(32, 34);
           // print('batteryD status is $batteryD');
           assistD = line.substring(34, 35);
           // print('assistD status is $assistD');
           KeyIPD = line.substring(35, 36);
         } else if
            (line.isNotEmpty) {
             // print('data frame is incorrect');
            // line = line;

           } else {
             rpmD = '00000';
             speedD = '000';
             fuelLevelD = '0';
             odometerD = '000000';
             headLampD = '0';
             gearD = 'N';
             leftIndicatorD = '0';
             rightIndicatorD = '0';
             modeD = '0';
             serviceD = '0';
             batteryD = '00';
             assistD = '0';
             KeyIPD = '0';
             notifyListeners();
           }



         fuelLevelr = int.tryParse(fuelLevelD) ?? 0;
         if (fuelLevelr > 0 && fuelLevelr <= 9) {
           fuelvalue = fuelLevelr / 10;
         }
         else {
           fuelvalue = 0;
         }
         //speedr = speedD??'0';
         parsedSpeed = double.tryParse(speedD)??0;
         odometerr = int.tryParse(odometerD)??00000;
         gearr = int.tryParse(gearD);
         rpmr = int.tryParse(rpmD);
         serviceDr = serviceD;
         hazardr = hazardD;
         leftIndicatorr = leftIndicatorD;
         move = KeyIPD;

         rightIndicatorr = rightIndicatorD;
         parkingr = parkingD;
         headLampr = headLampD;
         move = KeyIPD;
         modeDr = modeD;
         highbeamr = highbeamD;
         sidestandDr = sidestandD;

         //switch_mode();//this will change the screen according to the mode input
         leftIndicatorr == '1' ? left = true : left = false;
         rightIndicatorr == '1' ? right = true : right = false;
         headLampr == '1' ? headlamp = true : headlamp = false;
         highbeamr == '1' ? highbeam = true : highbeam = false;
         sidestandDr == '1' ? side_stand = true : side_stand = false;
         hazardr == '1' ? hazard = true : hazard = false;
         parkingr == '1' ? parking_mode = true : parking_mode = false;


         notifyListeners();


         // });



     } catch (e) {
       print('Error loading gauge values: $e');
     }
   }


   void indicator() {
     if (timer1 == null) {
       timer1 = Timer.periodic(Duration(milliseconds: 1000), (_) {

           if (i <= 6) {

             left = !left;
             right = !right;
             hazard = !hazard;
             malfunction = !malfunction;
             highbeam = !highbeam;
             side_stand = !side_stand;
             parking_mode = !parking_mode;
             parking_brake = !parking_brake;
             headlamp=!headlamp;

             i = i + 1;
             notifyListeners();
           } else {
             indicator_flag=true;
             timer1?.cancel();
             notifyListeners();
           }


         });

     }
   }








}