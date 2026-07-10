import 'package:audio_book/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AuthScaffoldCopy extends StatelessWidget {
  const AuthScaffoldCopy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Velvet Night',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome Back',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                'Log in to continue your story where you left off.',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  color: AppColors.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EMAIL ADDRESS',
                                style: TextStyle(color: AppColors.primary),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.alternate_email,
                                    color: AppColors.primary,
                                  ),
                                  hintText: 'your@email.com',
                                  hintStyle: TextStyle(
                                    color: AppColors.grayText,
                                    fontSize: 15,
                                  ),
                                  fillColor: AppColors.scaffoldBg,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: AppColors.scaffoldBg,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: AppColors.scaffoldBg,
                                    ),
                                  )
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'PASSWORD',
                                style: TextStyle(color: AppColors.primary),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: AppColors.primary,
                                  ),
                                  hintText: '1234567',
                                  hintStyle: TextStyle(
                                    color: AppColors.grayText,
                                    fontSize: 10,
                                  ),
                                  fillColor: AppColors.scaffoldBg,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                      color: AppColors.scaffoldBg,
                                    ),
                                  ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide(
                                        color: AppColors.scaffoldBg,
                                      ),
                                    )
                                ),
                              ),
                              SizedBox(height: 20),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  width:double.infinity,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.primary,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30),
                              Center(
                                child: Text(
                                  'OR CONTINUE WITH',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grayText,
                                  ),
                                ),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.scaffoldBg,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 18,right: 18,top: 8,bottom: 8),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Image.asset(
                                                'assets/icon/google.png',
                                              ),
                                            ),
                                            SizedBox(width: 3),
                                            Text("Google"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 30,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        width: 2,
                                        color: AppColors.scaffoldBg,
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 18,right: 18,top: 8,bottom: 8),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Image.asset(
                                                'assets/icon/apple-logo.png',
                                              ),
                                            ),
                                            SizedBox(width: 3),
                                            Text("Apple"),
                                          ],
                                        ),
                                      ),
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
            SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Don`t have an account? ',style:  TextStyle(fontSize: 15,color: AppColors.primary),),
                Text('Signup',style:  TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: AppColors.primary),),

              ],)
            ],
          ),
        ),
      ),
    );
  }
}
