import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector_pro/matrix_gesture_detector_pro.dart';


class OverlayedWidget extends StatelessWidget {
  final int id;
  final Widget child;
  const OverlayedWidget({super.key,Color? color, required this.child, required this.id});


  @override
  Widget build(BuildContext context) {
    final ValueNotifier<Matrix4> notifier = ValueNotifier(Matrix4.identity());
    return  GestureDetector(
      
      child: MatrixGestureDetector(
                      onMatrixUpdate: (m, tm, sm, rm) {
                        notifier.value = m;
                      },
              child: AnimatedBuilder(
                        animation: notifier,
                        builder: (ctx, widgetchild) {
                return Transform(
                  transform: notifier.value,
                  child:Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child:child
                      ),
                  ),
                );
                        },
                      ),
                    ),
    );
  }
}