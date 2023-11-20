
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/variables_func.dart';

class count_provider extends ChangeNotifier{




  ///////////////////////////////
   Future<void> loadGaugeValues() async {
     try {

       String line = rawdata.toString();










         //    await Future.delayed(const Duration(milliseconds: 1));


       if (line.isNotEmpty && line.startsWith('*E') && line.endsWith('&P') && line!=null ){
           rpmD = line.substring(2, 7);
           print(rpmD);
           speedD = line.substring(8, 11);
           fuelLevelD = line.substring(12, 13);
           odometerD = line.substring(14, 20);
           headLampD = line.substring(21, 22);
           gearD = line.substring(23, 24) ?? 'N';
           leftIndicatorD =line.substring(25, 26);
           rightIndicatorD =line.substring(27, 28);
           modeD = line.substring(29, 30);
           serviceD =line.substring(31, 32);
           batteryD =line.substring(32, 34);
           assistD = line.substring(34, 35);
           KeyIPD = line.substring(35, 36);


           //my rpms logic sensor 1

           String xxy=(int.parse(line.substring(40,42),radix:16)).toString();
           double xy = (double.tryParse(xxy)! * 2.0 - 90.0)*0.145;  //will pass in to psi1 as string

           String xxy2= (int.parse(line.substring(42,44),radix:16)).toString();
           double xy2=(double.tryParse(xxy)! -40); //pass to temprature

           String xxy3=(int.parse(line.substring(44,46),radix:16)).toString();
           double xy3=(double.tryParse(xxy)! *100/127);  //pass to  TPMS battery




           //my tpms logic sensor 2


           String aab=(int.parse(line.substring(46,48),radix:16)).toString();
           double ab = (double.tryParse(xxy)! * 2.0 - 90.0)*0.145;  //will pass in to psi2 as string

           String aab2= (int.parse(line.substring(48,50),radix:16)).toString();
           double ab2=(double.tryParse(xxy)! -40); //pass to temprature2

           String aab3=(int.parse(line.substring(50,52),radix:16)).toString();
           double ab3=(double.tryParse(xxy)! *100/127);  //pass to  TPMS battery2





           ////////////////
         }  else {
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





         //passing the tpms values


        psi1=xy.toStringAsFixed(1);
        psi2=ab.toStringAsFixed(1);

        temp1=xy2.toStringAsFixed(1);
        temp2=ab2.toStringAsFixed(1);

        tpms_battery=xy3.toStringAsFixed(1);
        tpms_battery2=ab3.toStringAsFixed(1);






         notifyListeners();


         // });



     } catch (e) {
       print('Error loading gauge values: $e');
     }
   }











}