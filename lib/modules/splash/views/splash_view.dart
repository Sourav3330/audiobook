import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  RxInt currentindex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Column(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(

            child: Obx(()=>
                Stepper(steps: [
                Step(title: Text('Complete Profile'), content: Text('this is the first step')),
                Step(title: Text('Add Address'), content: Text('this is the second step')),
                Step(title: Text('Add Company Details'), content: Text('this is the third step')),
                Step(title: Text('Add Bank Account'), content: Text('this is the fourth step')),
                Step(title: Text('Complete Final Step'), content: Text('this is the fifth step')),
              ],
                onStepTapped: (step){
                currentindex.value = step;
                },
                currentStep: currentindex.value,

                  onStepContinue: (){
                  if (currentindex.value<4) {
                    currentindex.value++;
                  }
                  },
                  onStepCancel: (){
                  if(currentindex.value>0) {
                    currentindex.value--;
                  }
                  },
                 ),
            ),


        ),
        CircularProgressIndicator(

        )
      ],
    )
    ,
    );
  }
}
