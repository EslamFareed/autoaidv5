// import 'package:teste_web//flutter_flow/flutter_flow_theme.dart';
// import 'package:teste_web//flutter_flow/flutter_flow_util.dart';
// import 'package:teste_web//flutter_flow/flutter_flow_widgets.dart';
import 'package:teste_web/flutter_flow/flutter_flow_model.dart';
import 'car_centers.dart' show CarCentersWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CarCentersModel extends FlutterFlowModel<CarCentersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
