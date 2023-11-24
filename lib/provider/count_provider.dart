
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/variables_func.dart';

class count_provider extends ChangeNotifier{




  ///////////////////////////////
   Future<void> loadGaugeValues() async {
     try {

       String line = rawdata.toString();


       if (line.isNotEmpty && line.startsWith('*E') && line.endsWith('&P') && line!=null ){
           rpmD = line.substring(2, 7);
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
                       if(line.substring(41,47)==garbage_data)
                         {



                                xy = 0;  //will pass in to psi1 as string



                                 xy2=0; //pass to temprature


                                 xy3=0;  //pass to  TPMS battery
                         }

                       else {
                                xxy = (int.parse(line.substring(41, 43), radix: 16)).toString();

                                xy = (double.tryParse(xxy)! * 2.0 - 90.0) *
                                 0.145; //will pass in to psi1 as string


                                 xxy2 = (int.parse(line.substring(43, 45), radix: 16)).toString();
                                  xy2 = (double.tryParse(xxy2)! - 40); //pass to temprature

                                    xxy3 = (int.parse(line.substring(45, 47), radix: 16)).toString();
                                    xy3 = (double.tryParse(xxy3)! * 100 / 127); //pass to  TPMS battery

            }


           //my tpms logic sensor 2

                       if(line.substring(47,53)==garbage_data)
                         {

                           ab = 0; //will pass in to psi2 as string


                           ab2=0; //pass to temprature2


                           ab3=0;  //pass to  TPMS battery2


                         }

                       else{



                         aab=(int.parse(line.substring(47,49),radix:16)).toString();
                         ab = (double.tryParse(aab)! * 2.0 - 90.0)*0.145;  //will pass in to psi2 as string

                         aab2= (int.parse(line.substring(49,51),radix:16)).toString();
                         ab2=(double.tryParse(aab2)! -40); //pass to temprature2

                         aab3=(int.parse(line.substring(51,53),radix:16)).toString();
                         ab3=(double.tryParse(aab3)! *100/127);  //pass to  TPMS battery2




                       }







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





     } catch (e) {
       print('Error loading gauge values: $e');
     }
   }




}