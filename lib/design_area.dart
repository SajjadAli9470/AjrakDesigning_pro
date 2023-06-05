
import 'package:design_ajrak2/model/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:screenshot/screenshot.dart';
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
  ScreenshotController screenshotController = ScreenshotController();
  @override
  void initState() {
   
    // TODO: implement initState
    super.initState();
    context.read<HistoryBloc>().add(add_history(
        history: History(
            layers: null,
            backgroundColor: selectedColor,
            ratio: ratio,
            selectedItem: -1,
            border: ''
            )));
  }

  @override
  Widget build(BuildContext context) {


    Widget capturedContainer=   Container(
                    padding: const EdgeInsets.all(0),
                child: BlocBuilder<HistoryBloc, HistoryState>(
                  builder: (context, hstate) {
                    ratio = hstate.histroyList.isNotEmpty
                  ? hstate.histroyList.last.ratio
                  : ratio;
              selectedColor = hstate.histroyList.isNotEmpty
                  ? hstate.histroyList.last.backgroundColor
                  : selectedColor;
              var border=hstate.histroyList.isNotEmpty ? hstate.histroyList.last.border
                  : "";
                    return GestureDetector(
                                  onTap: (){
                                    context.read<HistoryBloc>().add(
                                                            add_history(
                                                                history: History(
                                                                  border: hstate.histroyList.last.border,
                                                                    selectedItem:-1,
                                                                    layers: hstate
                                                                        .histroyList.last.layers,
                                                                    backgroundColor:
                                                                        selectedColor,
                                                                    ratio: ratio,
                                                                    matrix: hstate.histroyList
                                                                        .last.matrix)));
                                  },
                                  child: AspectRatio(
                                    aspectRatio: ratio,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        image: border!='' && (hstate.histroyList.last.border!=null) ? DecorationImage(image: AssetImage(hstate.histroyList.last.border!),fit: BoxFit.fill ): null,
                                          color: selectedColor,
                                          borderRadius: BorderRadius.circular(10)),
                                      child: BlocBuilder<LayredBloc, LayredState>(
                                        builder: (context, state) {
                                          return Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ...state.layredList.map(
                                                (e) {
                                                  return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          context.read<HistoryBloc>().add(
                                                              add_history(
                                                                  history: History(
                                                                    border: hstate.histroyList.last.border,
                                                                      selectedItem: e.id,
                                                                      layers: hstate
                                                                          .histroyList.last.layers,
                                                                      backgroundColor:
                                                                          selectedColor,
                                                                      ratio: ratio,
                                                                      matrix: hstate.histroyList
                                                                          .last.matrix)));
                                                        });
                                                      },
                                                      child: e.child);
                                                },
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                  },
                ),
              );
            
            

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
              onTap: () {
                 screenshotController
                    .capture(delay: const Duration(milliseconds: 10))
                    .then((capturedImage) async {
                  ShowCapturedWidget(context, capturedImage!);
                }).catchError((onError) {
                  print(onError);
                });
              },
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
          child: Screenshot(
            controller: screenshotController,
            child: capturedContainer
            )
              
           
          
        ),
        bottomNavigationBar: const ButtomBar());
  }
    Future<dynamic> ShowCapturedWidget(
      
      BuildContext context, Uint8List capturedImage) {
    return showDialog(
      useSafeArea: false,
      context: context,
      builder: (context) => Dialog(
        
          child: Center(child: Image.memory(capturedImage)),
      ),
    );
  }
}
