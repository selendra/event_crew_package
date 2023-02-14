import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  void initLstWidget(){
    // Override Page Index 0 
    homeModel.lstPageWidget[0] = checkInPage();
    setState(() {
      print("homeModel.lstPageWidget ${homeModel.memberShiIptemsList.length}");
    });

  }

  @override
  void initState() {
    initLstWidget();
    homeModel.pageViewListenerInit(setState: (){});
    super.initState();
  }

  // Widget checkInPage({required int itemCount, required String networkImage, required String nameTicketType, required String checkInCount}) {
  Widget checkInPage() {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: MyText(text: "Check In", fontSize: 27, fontWeight: FontWeight.w600, hexaColor: primaryColor, ),
                ),
              ),
              
              // EventCardCom(
              //   img: networkImage, 
              //   title: 'Check In', 
              //   func: (){

              //   }
              // );
              // for (int i = 0; i < homeModel.memberShiIptemsList.length; i++)
              itemsGridList()
              // (itemCount: i, 
              //   networkImage: homeModel.memberShiIptemsList[i]['asset'], 
              //   nameTicketType: homeModel.memberShiIptemsList[i]['name'], 
              //   checkInCount: homeModel.memberShiIptemsList[i]['count']
              // ),
            ],
          )
        ),
      ),
    );
  }

  // Widget itemsGridList({required int itemCount, required String networkImage, required String nameTicketType, required String checkInCount}) {
  Widget itemsGridList() {
    return InkWell(
      onTap: () {
        Navigator.push<void>(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const QrScanner(title: "Check In", func: null, hallId: 'tga',),
          ),
        );
      },
      child: GridView.builder(
        itemCount: homeModel.memberShiIptemsList.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 16 / 7, 
          crossAxisCount: 1,
        ),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(homeModel.memberShiIptemsList[i]['asset']), 
                  fit: BoxFit.fill
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyText(
                      text: homeModel.memberShiIptemsList[i]['name'],
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color2: Colors.white,
                    ),
                    MyText(
                      text: homeModel.memberShiIptemsList[i]['count'],
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color2: Colors.grey[50],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
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