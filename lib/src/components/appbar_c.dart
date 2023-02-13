import 'package:event_crew/src/tool/app_utils.dart';
import 'package:flutter/material.dart';
import 'text_c.dart';

PreferredSizeWidget appBar({
  Color bgColor = Colors.transparent, 
  double elevation = 0,
  double toolbarHeight = 100,
  bool automaticallyImplyLeading = false,
  required String? avatarBgColor,
  required String? networkLogo,
  required String? title,
  required String? textColor,
  }) {
  return AppBar(
    backgroundColor: bgColor,
    elevation:elevation,
    toolbarHeight: toolbarHeight,
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: CircleAvatar(
              backgroundColor: AppUtil.convertHexaColor(avatarBgColor!),
              backgroundImage: NetworkImage(networkLogo!),
              radius: 100,
            ),
          ),

          MyText(
            left: 10,
            text: title,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            hexaColor: textColor,
          )
        ],
      ),
    ),
  );
}