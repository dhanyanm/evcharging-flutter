
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/cloud_firestore/all_station_ref.dart';
import 'package:login_ui/model/city_model.dart';
import 'package:im_stepper/stepper.dart';
import 'package:login_ui/pages/state/state_management.dart';
import 'package:get/get.dart';


class Search extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ) {
    RxInt currentPage = 0.obs ;
    var step = WidgetRef.watch(currentStep).sign;
    var cityWatch = WidgetRef.watch(selectedCity).length;

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Color(0xFFFDF9EE),
          body: Column(
            children: [
              //Step
              Obx(()=>NumberStepper(
                activeStep:  currentPage.value,
                direction: Axis.horizontal,
                enableNextPreviousButtons: false,
                enableStepTapping: false,
                numbers: [1, 2, 3, 4, 5],
                stepColor: Colors.black,
                activeStepColor: Colors.grey,
                numberStyle: TextStyle(color: Colors.white),

              ),),
              //Screen
              Expanded(child: step == currentPage.value ? displayCityList() : Container(),),
              //Button
              Expanded(child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: ElevatedButton(
                              onPressed:  (){

                                currentPage.value = currentPage.value - 1;
                              },
                              child: Text('Previous'),
                            )),
                        SizedBox(
                          width: 30,),
                        Expanded(
                            child: ElevatedButton(
                              onPressed: (){

                                currentPage.value = currentPage.value + 1;
                              },
                              child: Text('Next'),
                            )),
                      ],
                    )
                ),
              ),
              )
            ],
          ),
        ));
  }

  // displayCityList() {
  //   return FutureBuilder(
  //       future: getCities(),
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting)
  //           return Center(child: CircularProgressIndicator(),);
  //         else {
  //           var cities = snapshot.data as List<CityModel>;
  //           if (cities == null || cities.length == 0)
  //             return Center(child: Text('Connot load city list'),);
  //           else {
  //             return  ListView.builder(
  //                 itemCount: cities.length,
  //                 itemBuilder: (context, index) {
  //                   return GestureDetector(
  //                    onTap : null, child: ListView.builder(
  //                     itemCount: cities.length,
  //                     itemBuilder: (context,index){
  //                      return Card(
  //                        child: ListTile(
  //                          leading: Icon(Icons.home_work, color: Colors.black,),
  //                          //trailing: context.read(selectedCity).length== cities[index].address ? Icon(Icons.check): null,
  //                          title: Text('${cities[index].address}', style: GoogleFonts.robotoMono(),),
  //                        ),);
  //                   },));
  //                 });
  //           }
  //         }
  //       });
  // }

}

