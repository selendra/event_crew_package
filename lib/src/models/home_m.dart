import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';

class HomeModel {

  final PageController controller = PageController();
  
  int? active = 0; 

  Color? color = Colors.green.withOpacity(0.3);

  String? bgColor = "#F2F2F2";

  List<Map<String, dynamic>> itemsList = [
    {'asset': 'packages/event_crew/assets/icons/admission.png', 'name': 'Check In'},
    {'asset': 'packages/event_crew/assets/icons/check-out.png', 'name': 'Check Out'},
    {'asset': 'packages/event_crew/assets/icons/logout.png', 'name': 'Log Out'}
  ];

  List<Widget> lstPageWidget = [
    // checkInPage(),
    Center(child: MyText(text: "CheckIn",),),
    Center(child: MyText(text: "CheckOut",),),
    // Check(tabType: 'Check',),
    // Admission(tabType: 'Admission'),
    // const CheckOut(),
  ];
  
  set setItemsList(List<Map<String, dynamic>>? lst){
    itemsList = lst!;
  }

  set setLstPageWidget(List<Widget>? lst){
    lstPageWidget = lst!;
  }

  /// Add into initState
  void pageViewListenerInit({required dynamic setState}){
    controller.addListener(() {
      if (setState != null) setState;
    });
  }
  /// onTap(context, int i, setState)
  // Future<void> onTap(BuildContext context, int i, Function? setState) async {
    
    
  //   // Map<String, dynamic> dfmData = await StorageServices.fetchData('dfm_api');

  //   // // ignore: use_build_context_synchronously
  //   // DialogCom().dialogLoading(context, content: "Signing Out");
  //   // await StorageServices.clearStorage();


  //   // await StorageServices.storeData(dfmData, 'dfm_api');
                    
  //   // Dispose Web Socket
  //   // Provider.of<MDWSocketProvider>(context, listen: false).dispose();
                    
  //   // Navigator.pushAndRemoveUntil(
  //   //   context, 
  //   //   Transition(child: LoginPage(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT), 
  //   //   (route) => false
  //   // );
  // }
  
}