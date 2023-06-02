import 'dart:developer';

import 'package:design_ajrak2/model/history_model.dart';
import 'package:flutter/material.dart';
import 'blocs/bloc/history_bloc.dart';
import 'blocs/bloc/layred_bloc.dart';
import 'bottom_bar.dart';
import 'design_var.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class design_area extends StatefulWidget {
  const design_area({super.key});

  @override
  State<design_area> createState() => _design_areaState();
}

class _design_areaState extends State<design_area> {
  @override
  void initState() {
    log("i git runner");
    // TODO: implement initState
    super.initState();
    context.read<HistoryBloc>().add(add_history(
        history: History(
            layers: null, backgroundColor: selectedColor, ratio: ratio)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        appBar: AppBar(
          title: Text(
            'Ajrak Designing',
            style: TextStyle(color: ajrakColor),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
              top: Radius.circular(10),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ajrakColor, borderRadius: BorderRadius.circular(10)),
                child: const Text('Save'),
              ),
            )
          ],
        ),
        body: Center(
          child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
             for (var element in state.histroyList) {
                log('${element.backgroundColor}');
                log('${element.layers}');
                log('${element.matrix}');
                log('${element.ratio}');
             }
              ratio = state.histroyList.isNotEmpty
                  ? state.histroyList.first.ratio
                  : ratio;
              selectedColor = state.histroyList.isNotEmpty
                  ? state.histroyList.first.backgroundColor
                  : selectedColor;
              return AspectRatio(
                aspectRatio: ratio,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: selectedColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: BlocBuilder<LayredBloc, LayredState>(
                    builder: (context, state) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          ...state.layredList.map(
                            (e) {
                              return e.child;
                            },
                          )
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: const ButtomBar());
  }
}
