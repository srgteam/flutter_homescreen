
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_homescreen/variables_func.dart';

class count_provider extends ChangeNotifier{




  ///////////////////////////////
   Future<void> loadGaugeValues() async {
     try {

       List<String> My_data_lines = rawdata.toString().split('\n');
       String first_line_data =" ";
       String second_line_data= " ";

       for(String vehicle_data in My_data_lines)
         {

           if(vehicle_data.isNotEmpty && vehicle_data.startsWith('*E') && vehicle_data.endsWith('K#') && vehicle_data!=null)
             {
               first_line_data=vehicle_data ;
             }

           else if(vehicle_data.isNotEmpty && vehicle_data.startsWith('@Q') && vehicle_data.endsWith('&P') && vehicle_data!=null)

           {

             second_line_data=vehicle_data ;


           }

           else {

             second_line_data="@Q010101010101&P" ;
           }
         }






         String line = rawdata.toString();




         //    await Future.delayed(const Duration(milliseconds: 1));


         if (first_line_data.isNotEmpty && second_line_data.isNotEmpty ) {
           rpmD = first_line_data.substring(2, 7);
           speedD = first_line_data.substring(8, 11);
           fuelLevelD = first_line_data.substring(12, 13);
           odometerD = first_line_data.substring(14, 20);
           headLampD = first_line_data.substring(21, 22);
           gearD = first_line_data.substring(23, 24) ?? 'N';
           leftIndicatorD = first_line_data.substring(25, 26);
           rightIndicatorD =first_line_data.substring(27, 28);
           modeD = first_line_data.substring(29, 30);
           serviceD =first_line_data.substring(31, 32);
           batteryD =first_line_data.substring(32, 34);
           assistD = first_line_data.substring(34, 35);
           KeyIPD = first_line_data.substring(35, 36);


           //my rpms logic sensor 1

           String xxy=(int.parse(second_line_data.substring(2,4),radix:16)).toString();
           double xy = (double.tryParse(xxy)! * 2.0 - 90.0)*0.145;  //will pass in to psi1 as string

           String xxy2= (int.parse(second_line_data.substring(4,6),radix:16)).toString();
           double xy2=(double.tryParse(xxy)! -40); //pass to temprature

           String xxy3=(int.parse(second_line_data.substring(6,8),radix:16)).toString();
           double xy3=(double.tryParse(xxy)! *100/127);  //pass to  TPMS battery




           //my tpms logic sensor 2


           String aab=(int.parse(second_line_data.substring(8,10),radix:16)).toString();
           double ab = (double.tryParse(xxy)! * 2.0 - 90.0)*0.145;  //will pass in to psi2 as string

           String aab2= (int.parse(second_line_data.substring(10,12),radix:16)).toString();
           double ab2=(double.tryParse(xxy)! -40); //pass to temprature2

           String aab3=(int.parse(second_line_data.substring(12,14),radix:16)).toString();
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