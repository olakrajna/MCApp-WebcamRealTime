import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcapp/onborad_data.dart';
import 'package:mcapp/secondscreen.dart';
import 'package:mcapp/size_configs.dart';
import 'package:mcapp/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mcapp/home.dart';

import 'main.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {


  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
    // this will set seenOnboard to true when running onboard page for first time.
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  @override
  Widget build(BuildContext context) {
    // initialize size config
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: onboardingContents.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(
                        height: sizeV * 5,
                      ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child:
                      Text(
                        onboardingContents[index].title,
                        style: GoogleFonts.getFont('Montserrat',
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1,
                                wordSpacing: 2,
                                color: Color.fromRGBO(25, 25, 30, 1))),
                        textAlign: TextAlign.center,
                      ),
                  ),

                      SizedBox(
                        height: sizeV * 5,
                      ),
                      Container(
                        height: sizeV * 33,
                        child: Image.asset(
                          onboardingContents[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                      child: Text(
                        onboardingContents[index].description,
                        style: GoogleFonts.getFont('Montserrat',
                            textStyle: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1,
                                wordSpacing: 2,
                                color: Colors.black)),
                        textAlign: TextAlign.center,
                      ),),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                                        ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      currentPage == onboardingContents.length - 1
                          ? Expanded(
                        child: MyTextButton(
                          buttonName: 'Get Started',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondScreen(),
                                ));
                          },
                          bgColor: kPrimaryColor,
                        ),
                      )
                          : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(
                            name: 'Skip',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            },
                          ),
                          Row(
                            children: List.generate(
                              onboardingContents.length,
                                  (index) => dotIndicator(index),
                            ),
                          ),
                          OnBoardNavBtn(
                            name: 'Next',
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
class OnBoardNavBtn extends StatelessWidget {
  const OnBoardNavBtn({
    Key? key,
    required this.name,
    required this.onPressed,
  }) : super(key: key);
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      splashColor: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          name,
          style: kBodyText1,
        ),
      ),
    );
  }
}

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeH! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Container(
            alignment: Alignment.center,
            width: 250,
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(244, 178, 176, 1),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(247, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: Offset(4, 4),
                ),
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(-4, -4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Icon(Icons.arrow_forward,  color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
