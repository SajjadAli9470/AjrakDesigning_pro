part of 'layred_bloc.dart';

abstract class LayredEvent {
  const LayredEvent();
}

class all_layers extends LayredEvent {
  final List<LayeredWidget> layredList;

  all_layers({required this.layredList});
}

class add_layer extends LayredEvent {
  final LayeredWidget layer;

  add_layer({required this.layer});
}

class delete_layer extends LayredEvent {
  final int layer_id;

  delete_layer({required this.layer_id});
}

class modified_layer extends LayredEvent {
  final LayeredWidget layer;

  modified_layer({required this.layer});

}
