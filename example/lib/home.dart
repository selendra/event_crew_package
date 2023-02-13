import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  final String? logo;
  final String? title;


  const HomePage({super.key, required this.logo, required  this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final String primaryColor = "#254294";

  HomeModel homeModel = HomeModel();

  void onPageChange(value) async {
    
    homeModel.controller.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);

    if (homeModel.controller.page!.toInt() == 0){
      homeModel.color = Colors.blue.withOpacity(0.3);
    } else if ((homeModel.controller.page!.toInt() == 1)){
      homeModel.color = Colors.red.withOpacity(0.3);
    }

    homeModel.active = value;

    // if (value != homeModel.itemsList.length){
      
      
    // }
    //  else {

    //   // Just Close Dialog
    //   DialogCom().dialogMessage(
    //     context, 
    //     title: ClipRRect(
    //       borderRadius: BorderRadius.circular(100),
    //       child: SizedBox(
    //         width: 30,
    //         child: Lottie.asset(
    //           "packages/event_crew/assets/animation/exit.json",
    //           repeat: true,
    //           reverse: true,
    //           height: 100
    //         ),
    //       ),
    //     ), 
    //     edgeInsetsGeometry: const EdgeInsets.all(20),
    //     content: AnimatedTextKit(
    //       repeatForever: true,
    //       pause: const Duration(seconds: 1),
    //       animatedTexts: [

    //         TypewriterAnimatedText(
    //           "Are you sure wanna log out?",
    //           textAlign: TextAlign.center,
    //           textStyle: const TextStyle(
    //             fontSize: 14
    //           )
    //         ),

    //       ],
    //     ),
    //     // MyText(text: "Are you sure wanna sign out?",),
    //     action2: TextButton(
    //       // style: ButtonStyle(
    //       //   backgroundColor: MaterialStateProperty.all(Colors.red),
    //       //   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
    //       // ),
    //       onPressed: () async {
    //         Navigator.pop(context);

    //         // DialogCom().dialogLoading(context, content: "Signing Out");
    //         // await StorageServices.clearStorage();
                            
    //         // Dispose Web Socket
    //         // Provider.of<MDWSocketProvider>(context, listen: false).dispose();
                            
    //         // Navigator.pushAndRemoveUntil(
    //         //   context, 
    //         //   Transition(child: LoginPage(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT), 
    //         //   (route) => false
    //         // );
    //       },
    //       child: const MyText(text: "Yes", left: 10, right: 10, color2: Colors.red, fontSize: 12, fontWeight: FontWeight.bold,),
    //     ),
    //   );
    // }
    // await Future.delayed(Duration(milliseconds: 10), (){

    // });
    setState(() { });
  }

  void onTap(int value) async {

    homeModel.controller.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
    homeModel.active = value;

    if (homeModel.controller.page!.toInt() == 0){
      homeModel.color = Colors.blue.withOpacity(0.3);
    } else if ((homeModel.controller.page!.toInt() == 1)){
      homeModel.color = Colors.red.withOpacity(0.3);
    }
    setState(() { });

    // SoundUtil.soundAndVibrate(SOUND.FAILED);

    // DialogCom().errorMsg(context, 'Success');
  }

  @override
  void initState() {
    homeModel.lstPageWidget[0] = checkInPage();
    homeModel.pageViewListenerInit(setState: (){});
    super.initState();
  }

  Widget checkInPage() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: itemsGridList()
      ),
    );
  }

  Widget itemsGridList() {
    return GridView.builder(
      itemCount: 4,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 16 / 7, 
        crossAxisCount: 1,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://dangkorsenchey.com/images/memberships_card/Standard2.png"), 
                fit: BoxFit.fill
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const MyText(
                        text: "Basic",
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color2: Colors.white,
                      ),
                      MyText(
                        text: "0 Check In",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color2: Colors.grey[50],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar(
        title: widget.title,
        networkLogo: widget.logo,
        textColor: primaryColor,
        avatarBgColor: primaryColor
      ),
      body: MyPageView(
        homeModel: homeModel,
        onPageChange: onPageChange,
      ),
      bottomNavigationBar: bottomAppBarNoCheck(context: context, bgColor: primaryColor, controller: homeModel.controller, itemsList: homeModel.itemsList, active: homeModel.active, onTap: onTap
      // (context, i){
      //   // homeModel!.onTap(context, i, (){
      //   //   setState(() {
      //   //     print()
      //   //   });
      //   // });
      // }
      ),
    );
  }
}