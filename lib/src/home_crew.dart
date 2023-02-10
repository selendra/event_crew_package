import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  HomeModel homeModel = HomeModel();

  @override
  void initState() {

    homeModel.controller.addListener(() {
      setState(() {
        homeModel.active = homeModel.controller.page!.toInt();
      });
    });
    super.initState();
  }

  /// onPageChange(int value)
  void onPageChange(int value) {
    homeModel.active = homeModel.controller.page!.toInt();

    if (homeModel.controller.page!.toInt() == 0){
      homeModel.color = Colors.blue.withOpacity(0.3);
    } else if ((homeModel.controller.page!.toInt() == 1)){
      homeModel.color = Colors.red.withOpacity(0.3);
    }
    if (value != homeModel.itemsList.length - 1){
      
      homeModel.controller.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
      
    } else {

      // Just Close Dialog
      DialogCom().dialogMessage(
        context, 
        title: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 30,
            child: Lottie.asset(
              "packages/event_crew/assets/animation/exit.json",
              repeat: true,
              reverse: true,
              height: 100
            ),
          ),
        ), 
        edgeInsetsGeometry: const EdgeInsets.all(20),
        content: AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 1),
          animatedTexts: [

            TypewriterAnimatedText(
              "Are you sure wanna log out?",
              textAlign: TextAlign.center,
              textStyle: const TextStyle(
                fontSize: 14
              )
            ),

          ],
        ),
        // MyText(text: "Are you sure wanna sign out?",),
        action2: TextButton(
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(Colors.red),
          //   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
          // ),
          onPressed: () async {
            Navigator.pop(context);

            // DialogCom().dialogLoading(context, content: "Signing Out");
            // await StorageServices.clearStorage();
                            
            // Dispose Web Socket
            // Provider.of<MDWSocketProvider>(context, listen: false).dispose();
                            
            // Navigator.pushAndRemoveUntil(
            //   context, 
            //   Transition(child: LoginPage(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT), 
            //   (route) => false
            // );
          },
          child: const MyText(text: "Yes", left: 10, right: 10, color2: Colors.red, fontSize: 12, fontWeight: FontWeight.bold,),
        ),
      );
    }
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppUtil.convertHexaColor(homeModel.bgColor!),
      body: SafeArea(
        child: MyPageView(
          homeModel: homeModel,
          onPageChange: onPageChange
        ),
      ),
      bottomNavigationBar: bottomAppBarNoCheck(
        context: context, 
        controller: homeModel.controller, 
        active: homeModel.active,
        itemsList: homeModel.itemsList,
        onTap: onPageChange
      )
    );
  }
}