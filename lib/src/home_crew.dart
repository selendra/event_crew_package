import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final PageController controller = PageController();
  
  int? active = 0; 

  Color? color = Colors.green.withOpacity(0.3);

  List<Map<String, dynamic>> itemsList = [
    {'asset': 'packages/event_crew/assets/icons/admission.png', 'name': 'Admission'},
    {'asset': 'packages/event_crew/assets/icons/check-out.png', 'name': 'Check Out'},
    {'asset': 'packages/event_crew/assets/icons/logout.png', 'name': 'Log Out'}
  ];

  @override
  void initState() {

    controller.addListener(() {
      setState(() {
        
        active = controller.page!.toInt();
      });
    });
    super.initState();
  }

  Future<void> onTap(int i) async {
    
    if (i != itemsList.length - 1){
      
      controller.animateToPage(i, duration: const Duration(milliseconds: 300), curve: Curves.easeOutExpo);
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
    // Map<String, dynamic> dfmData = await StorageServices.fetchData('dfm_api');

    // // ignore: use_build_context_synchronously
    // DialogCom().dialogLoading(context, content: "Signing Out");
    // await StorageServices.clearStorage();


    // await StorageServices.storeData(dfmData, 'dfm_api');
                    
    // Dispose Web Socket
    // Provider.of<MDWSocketProvider>(context, listen: false).dispose();
                    
    // Navigator.pushAndRemoveUntil(
    //   context, 
    //   Transition(child: LoginPage(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT), 
    //   (route) => false
    // );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppUtil.convertHexaColor("#F2F2F2"),
      body: SafeArea(
        child: PageView(
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              active = controller.page!.toInt();

              if (controller.page!.toInt() == 0){
                color = Colors.blue.withOpacity(0.3);
              } else if ((controller.page!.toInt() == 1)){
                color = Colors.red.withOpacity(0.3);
              }
            });
          },
          children: const [
            Center(child: MyText(text: "Admission",),),
            Center(child: MyText(text: "CheckOut",),),
            // Check(tabType: 'Check',),
            // Admission(tabType: 'Admission'),
            // const CheckOut(),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppBarNoCheck(
        context: context, 
        controller: controller, 
        active: active,
        itemsList: itemsList,
        onTap: onTap
      )
    );
  }
}