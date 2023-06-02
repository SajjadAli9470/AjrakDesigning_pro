import 'package:flutter/material.dart';

import 'design_var.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
                    onTap: (){
                    },
                    child: Container(
                     
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Icon(Icons.help_sharp,color:ajrakColor,size: 40,)) ,
                  );
  }
}