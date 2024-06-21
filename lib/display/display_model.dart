import '/flutter_flow/flutter_flow_util.dart';
import 'display_widget.dart' show DisplayWidget;
import 'package:flutter/material.dart';

class DisplayModel extends FlutterFlowModel<DisplayWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
