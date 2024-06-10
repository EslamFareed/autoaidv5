import 'package:teste_web/flutter_flow/flutter_flow_model.dart';

// import 'package:teste_web/flutter_flow/flutter_flow_button_tabbar.dart';
// import 'package:teste_web/flutter_flow/flutter_flow_icon_button.dart';
import 'package:teste_web/flutter_flow/flutter_flow_theme.dart';
import 'package:teste_web/flutter_flow/flutter_flow_util.dart';
import 'package:teste_web/flutter_flow/flutter_flow_widgets.dart';
import 'sos.dart' show SosWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SosModel extends FlutterFlowModel<SosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }
}
