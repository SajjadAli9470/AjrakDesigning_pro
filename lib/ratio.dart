import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/history_bloc.dart';
import 'design_var.dart';
import 'model/history_model.dart';

class Ratio extends StatefulWidget {
  const Ratio({super.key});

  @override
  State<Ratio> createState() => _RatioState();
}

class _RatioState extends State<Ratio> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<HistoryBloc, HistoryState>(
                    builder: (context, state) {
                      return InkWell(
                                      onTap: () {
                                        setState(() {
                                          aspect_ratio = 1 / 2;
                                        });
                                        context.read<HistoryBloc>().add(add_history(
                          history: History(layers:state.histroyList.first.layers , backgroundColor: selectedColor, ratio: ratio,matrix: state.histroyList.first.matrix)));
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 30,
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(3),
                                            border: Border.all(color: Colors.black, width: 3)),
                                        child: Text(
                                          '1:2',
                                          style: TextStyle(fontSize: 8),
                                        ),
                                      ),
                                    );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        aspect_ratio = 1;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Text(
                        '1:1',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        aspect_ratio = 16 / 9;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 30,
                      width: 50,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Text(
                        '16:9',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        aspect_ratio = 9 / 16;
                      });
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 40,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(color: Colors.black, width: 3)),
                      child: Text(
                        '9:16',
                        style: TextStyle(fontSize: 8),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
      child: Container(
       
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
        ),
        child: Icon(Icons.aspect_ratio_rounded,color: Colors.black,size: 40,),
      ),
    );
  }
}
