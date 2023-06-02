import 'package:bloc/bloc.dart';
import 'package:design_ajrak2/model/layred_widgets.dart';


part 'layred_event.dart';
part 'layred_state.dart';

class LayredBloc extends Bloc<LayredEvent, LayredState> {
  LayredBloc() : super(LayredState(layredList: [])) {
    on<all_layers>((event, emit) {
      List<LayeredWidget> recieved = event.layredList;
      state.layredList.clear();
      if (recieved.isNotEmpty) {
        emit(LayredState(layredList: recieved)); 
      }
    });
    on<add_layer>(
      (event, emit) {
        emit(LayredState(layredList: state.layredList..add(event.layer)));
      },
    );
    on<delete_layer>(
      (event, emit) {
        emit(LayredState(
            layredList: state.layredList
              ..removeWhere((element) => element.id == event.layer_id)));
      },
    );
  }
}
