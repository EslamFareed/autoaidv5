// import 'package:teste_web/flutter_flow/flutter_flow_credit_card_form.dart';
import 'package:credit_card_form/credit_card_form.dart';
// import 'package:teste_web/flutter_flow/flutter_flow_icon_button.dart';
import 'package:teste_web/flutter_flow/flutter_flow_theme.dart';
import 'package:teste_web/flutter_flow/flutter_flow_util.dart';
import 'package:teste_web/flutter_flow/flutter_flow_widgets.dart';
import 'visa.dart' show VisaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VisaModel extends FlutterFlowModel<VisaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for CreditCardForm widget.
CreditCardController? VisaController;

  final creditCardFormKey = GlobalKey<FormState>();
  // CreditCardModel creditCardInfo = emptyCreditCard();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
