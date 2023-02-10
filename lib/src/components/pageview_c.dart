import 'package:event_crew/event_crew.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget{

  final HomeModel? homeModel;
  final Function(int)? onPageChange;

  const MyPageView({super.key, this.homeModel, this.onPageChange});

  @override
  Widget build(BuildContext context){
    return PageView(
      controller: homeModel!.controller,
      onPageChanged: onPageChange!,
      children: homeModel!.lstPageWidget,
    );
  }
}