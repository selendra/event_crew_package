import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';
import 'package:event_crew/src/components/text_c.dart';
// import 'package:event_crew/src/provider/mdw_socket_p.dart';
// import 'package:event_crew/src/registration/login.dart';
// import 'package:event_crew/src/service/storage.dart';
// import 'package:provider/provider.dart';
// import 'package:transition/transition.dart';

// Widget bottomAppBar({
//   required BuildContext? context,
//   required PageController? controller,
//   required int? active
// }){

//   const double iconSize = 25;

//   return BottomAppBar(
//     child: SizedBox(
//       height: 70,
//       child: Row(
//         children: [
    
//           Expanded(
//             child: SizedBox(
//               height: double.maxFinite,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
                  
                    
//                   Expanded(
//                     child: InkWell(
//                       onTap: (){
//                         controller!.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
//                       }, 
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
                      
//                           Image.asset('packages/event_crew/assets/icons/check.png', width: iconSize,),
                      
//                           const MyText(
//                             width: double.maxFinite,
//                             top: 5,
//                             text: "Check",
//                             fontSize: 10,
//                             bottom: 5,
//                           ),
//                         ],
//                       )
                      
//                     ),
//                   ),
                    
//                   active == 0 ? Container(
//                     height: 5,
//                     width: double.maxFinite,
//                     color: Colors.blue,
//                   ) : Container()
//                 ],
//               ),
//             ),
//           ),

//           Expanded(
//             child: SizedBox(
//               height: double.maxFinite,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
                  
//                   Expanded(
//                     child: InkWell(
//                       onTap: (){
                      
//                         controller!.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
//                       }, 
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
                      
//                           Image.asset('packages/event_crew/assets/icons/admission.png', width: iconSize),
                      
//                           const MyText(
//                             width: double.maxFinite,
//                             top: 5,
//                             text: "Admission",
//                             fontSize: 10,
//                             bottom: 5,
//                           ),
//                         ],
//                       )
                      
//                     ),
//                   ),
                    
//                   active == 1 ? Container(
//                     height: 5,
//                     width: double.maxFinite,
//                     color: Colors.blue,
//                   ) : Container()
//                 ],
//               ),
//             ),
//           ),
    
//           Expanded(
//             child: SizedBox(
//               height: double.maxFinite,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
                    
//                   Expanded(
//                     child: InkWell(
//                       onTap: (){
                          
//                         controller!.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
//                       }, 
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
                          
//                           Image.asset('packages/event_crew/assets/icons/check-out.png', width: iconSize),
                          
//                           const MyText(
//                             width: double.maxFinite,
//                             top: 5,
//                             text: "Check Out",
//                             fontSize: 10,
//                             bottom: 5,
//                           ),
//                         ],
//                       )
                      
//                     ),
//                   ),
                    
//                   active == 2 ? Container(
//                     height: 5,
//                     width: double.maxFinite,
//                     color: Colors.blue,
//                     margin: const EdgeInsets.only(bottom: 5),
//                   ) : Container()
//                 ],
//               ),
//             ),
//           ),
    
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
                  
//                 InkWell(
//                   onTap: (){

//                     DialogCom().dialogMessage(
//                       context!, 
//                       title: ClipRRect(
//                         borderRadius: BorderRadius.circular(100),
//                         child: SizedBox(
//                           width: 30,
//                           child: Lottie.asset(
//                             "assets/animation/exit.json",
//                             repeat: true,
//                             reverse: true,
//                             height: 100
//                           ),
//                         ),
//                       ), 
//                       edgeInsetsGeometry: const EdgeInsets.all(20),
//                       content: AnimatedTextKit(
//                         repeatForever: true,
//                         pause: const Duration(seconds: 1),
//                         animatedTexts: [

//                           TypewriterAnimatedText(
//                             "Are you sure wanna log out?",
//                             textAlign: TextAlign.center,
//                             textStyle: const TextStyle(
//                               fontSize: 14
//                             )
//                           ),

//                         ],
//                       ),
//                       // MyText(text: "Are you sure wanna sign out?",),
//                       action2: TextButton(
//                         // style: ButtonStyle(
//                         //   backgroundColor: MaterialStateProperty.all(Colors.red),
//                         //   shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
//                         // ),
//                         onPressed: () async {

//                           DialogCom().dialogLoading(context, content: "Signing Out");
//                           await StorageServices.clearStorage();
                                          
//                           // Dispose Web Socket
//                           // Provider.of<MDWSocketProvider>(context, listen: false).dispose();
                                          
//                           // Navigator.pushAndRemoveUntil(
//                           //   context, 
//                           //   Transition(child: LoginPage(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT), 
//                           //   (route) => false
//                           // );
//                         },
//                         child: const MyText(text: "Yes", left: 10, right: 10, color2: Colors.red, fontSize: 12, fontWeight: FontWeight.bold,),
//                       ),
//                     );
//                   }, 
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
                  
//                       Image.asset('packages/event_crew/assets/icons/logout.png', width: iconSize),
                  
//                       const MyText(
//                         width: double.maxFinite,
//                         top: 5,
//                         text: "Log out",
//                         fontSize: 10,
//                         bottom: 5,
//                       ),
//                     ],
//                   )
                  
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

/// TextColor = Hexa Code Of Color
Widget bottomAppBarNoCheck({
  required BuildContext? context,
  required String? bgColor,
  String indicatorColor = "#FFFFFF",
  String textColor = "#FFFFFF",
  required PageController? controller,
  required List<Map<String, dynamic>> itemsList,
  required int? active,
  required Function(int)? onTap
  
}){

  const double iconSize = 25;

  return BottomAppBar(
    color: bgColor != null ? AppUtil.convertHexaColor(bgColor) : null,
    child: SizedBox(
      height: 70,
      child: Row(
        children: [

          for (int i = 0; i < itemsList.length; i++)
          Expanded(
            child: SizedBox(
              height: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        onTap!(i);
                        // controller!.animateToPage(i, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
                      }, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Image
                          // (image: AssetImage('packages/event_crew/assets/icons/admission.png')),
                          .asset(itemsList[i]['asset'], width: iconSize),
                      
                          MyText(
                            width: double.maxFinite,
                            top: 5,
                            text: itemsList[i]['name'],
                            fontSize: 10,
                            bottom: 5,
                            hexaColor: textColor,
                          ),
                        ],
                      )
                      
                    ),
                  ),
                    
                  active == i ? Container(
                    height: 5,
                    width: double.maxFinite,
                    color: AppUtil.convertHexaColor(indicatorColor),
                  ) : Container()
                ],
              ),
            ),
          ),

        ],
      ),
    ),
  );
}