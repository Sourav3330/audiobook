import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AuthScaffold extends StatelessWidget {
  final String topScreenTitle;
  final String topScreenMessage;
  final VoidCallback onTapGoogle;
  final VoidCallback onTapIos;
  final VoidCallback toggleLoginSignup;
  final Widget cardChild;
  final String bottomLoginOrSignupButtonText;
  final String bottomLoginOrSignupMessage;
  final String buttonText;
  final VoidCallback buttonOnTap;
  final VoidCallback onTapLoginSignup;


  const AuthScaffold({
    super.key,
    required this.topScreenMessage,
    required this.topScreenTitle,
    required this.onTapGoogle,
    required this.onTapIos,
    required this.toggleLoginSignup,
    required this.cardChild,
    required this.bottomLoginOrSignupButtonText,
    required this.bottomLoginOrSignupMessage,
    required this.buttonText,
    required this.buttonOnTap,
    required this.onTapLoginSignup,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                topScreenTitle,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10),
              Text(
                topScreenMessage,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                  color: AppColors.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      children: [
                        cardChild,
                        SizedBox(height: 20),
                        TextButton(
                          onPressed:buttonOnTap,
                          child: Container(
                            width:double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.primary,
                            ),
                            child: Center(
                              child: Text(
                                buttonText,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
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
                            SizedBox(height: 30),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      padding: const EdgeInsets.only(
                                        left: 18,
                                        right: 18,
                                        top: 8,
                                        bottom: 8,
                                      ),
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
                                SizedBox(width: 30),
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
                                      padding: const EdgeInsets.only(
                                        left: 18,
                                        right: 18,
                                        top: 8,
                                        bottom: 8,
                                      ),
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
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bottomLoginOrSignupMessage,
                    style: TextStyle(fontSize: 15, color: AppColors.primary),
                  ),
                  InkWell(
                    onTap: onTapLoginSignup,
                    child: Text(
                      bottomLoginOrSignupButtonText,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
