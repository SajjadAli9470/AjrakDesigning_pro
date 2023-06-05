import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/history_bloc.dart';
import 'blocs/bloc/layred_bloc.dart';
import 'design_var.dart';
import 'model/history_model.dart';

class LayersDown extends StatefulWidget {
  const LayersDown({super.key});

  @override
  State<LayersDown> createState() => _LayersDownState();
}

class _LayersDownState extends State<LayersDown> {
   @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, hstate) {
        int selectedd = hstate.histroyList.isNotEmpty
            ? hstate.histroyList.last.selectedItem
            : -1;
        return InkWell(
          onTap: () {

            if(selectedd!=-1){context.read<LayredBloc>().add(delete_layer(layer_id: selectedd));
            context.read<HistoryBloc>().add(add_history(
        history: History(
            layers: hstate.histroyList.last.layers,
            backgroundColor: selectedColor,
            ratio: hstate.histroyList.last.ratio,
            selectedItem: -1,
            border: hstate.histroyList.last.border
            )));}
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(
                Icons.layers_outlined,
                color:
                    selectedd != -1 ? ajrakColor : ajrakColor.withOpacity(0.4),
                size: 40,
              )),
        );
      },
    );
  }

}