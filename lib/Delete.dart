import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bloc/history_bloc.dart';
import 'design_var.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, hstate) {
        int selectedd=hstate.histroyList.isNotEmpty ? hstate.histroyList.last.selectedItem : -1;
        return InkWell(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
              ),
              child: Icon(
                Icons.delete_outline_rounded,
                color: selectedd!=-1 ? ajrakColor :ajrakColor.withOpacity(0.4),
                size: 40,
              )),
        );
      },
    );
  }
}
