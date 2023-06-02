import 'package:design_ajrak2/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Overlayed.dart';
import 'blocs/bloc/history_bloc.dart';
import 'design_var.dart';
import 'model/layred_widgets.dart';

class Borders extends StatefulWidget {
  const Borders({super.key});

  @override
  State<Borders> createState() => _BordersState();
}

class _BordersState extends State<Borders> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          barrierColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) {
            return Container(
              height: 80,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (int i = 1; i <= 2; i++)
                      InkWell(
                        onTap: () {
                          int id = index++;
                          var layer = LayeredWidget(
                              id: id,
                              child: OverlayedWidget(
                                  id: id,
                                  child:
                                      Image.asset('assets/borders/b_$i.png')));
                          context.read<HistoryBloc>().add(add_history(
                              history: History(
                                  layers: layer,
                                  backgroundColor: selectedColor,
                                  ratio: ratio)));
                          // setState(() {

                          // });
                        },
                        child: Container(
                            // color: const Color.fromARGB(255, 243, 243, 243),
                            padding:const EdgeInsets.all(5),
                            margin:const EdgeInsets.all(5),
                            child: Image.asset('assets/borders/b_$i.png')),
                      )
                  ],
                ),
              ),
            );
          },
        );
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
          ),
          child: Icon(
            Icons.border_outer_rounded,
            color: Colors.black,
            size: 40,
          )),
    );
  }
}
