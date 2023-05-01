import 'package:appComida/assets/repository/onboarding_repository.dart';
import 'package:appComida/src/feature/home/view/page/homepage.dart';
import 'package:appComida/src/feature/login/view/page/login.dart';
import 'package:appComida/src/feature/onboarding/view/page/app_style.dart';
import 'package:appComida/src/feature/onboarding/view/page/size_configs.dart';
import 'package:appComida/src/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appComida/src/feature/login/view/page/login.dart';

import '../widget/button_to_home.dart';
import '../widget/navegation_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(microseconds: 400),
      height: 12,
      width: 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : kSecondaryColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Future setSeenOnboard()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setSeenOnboard();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
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
              itemCount: onboardingConteudos.length,
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    height: sizeV * 2,
                  ),
                  Text(
                    onboardingConteudos[index].title,
                    style: const TextStyle(
                        color: Colors.red,
                        fontFamily: 'PermanentMarker',
                        fontSize: 37),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sizeV * 3,
                  ),
                  Container(
                    height: sizeV * 45,
                    child: Image.asset(
                      onboardingConteudos[index].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                  Text(
                    onboardingConteudos[index].onBoardText,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Billabong',
                        fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sizeV * 5,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingConteudos.length - 1
                  ? MyTextButton(
                    buttoName: 'Ir ao Login',
                    onPressed: (){
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context)=>
                          LoginPage()));
                    },
                    bgColor: kPrimaryColor,
                    )
                  : Row (
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OnBoardNavBtn(
                        name: 'Pular',
                        onPressed: () {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>
                          HomePage()));
                        },
                      ),
                      Row(
                        children: List.generate(onboardingConteudos.length,
                            (index) => dotIndicator(index)),
                      ),
                      OnBoardNavBtn(
                        name: 'Continuar', 
                        onPressed: () {
                          _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
                        }),
                    ],
                  ),
                ],
              ))
        ],
      )),
    );
  }
}



