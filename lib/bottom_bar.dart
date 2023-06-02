import 'package:design_ajrak2/background.dart';
import 'package:design_ajrak2/help.dart';
import 'package:design_ajrak2/patterns.dart';
import 'package:design_ajrak2/ratio.dart';
import 'package:flutter/material.dart';

import 'Overlayed.dart';
import 'border.dart';
import 'design_area.dart';
import 'design_var.dart';

class ButtomBar extends StatefulWidget {
  const ButtomBar({super.key});

  @override
  State<ButtomBar> createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  @override
  Widget build(BuildContext context) {
    return   Container(
        width: MediaQuery.of(context).size.width,
        height: 80 ,
        
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Pattrens(),
                  Borders(),
                  BackGround(),
                  Ratio(),
                  Help(), 
              ],
            ),
          ),
        )
      )   
    
    ;
  }
}