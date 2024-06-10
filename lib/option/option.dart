import 'package:autoaidv5/Login/login.dart';
import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:autoaidv5/car_info/car_info.dart';
import 'package:autoaidv5/complaint/complaint.dart';
import 'package:autoaidv5/delete_account/delete_account.dart';
import 'package:autoaidv5/profile/profile.dart';
import 'package:autoaidv5/requests/requests.dart';
import 'package:autoaidv5/sos/sos.dart';
import 'package:autoaidv5/wallet/wallet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:teste_web/flutter_flow/flutter_flow_model.dart';
import 'package:teste_web/flutter_flow/flutter_flow_theme.dart';
import 'package:teste_web/flutter_flow/flutter_flow_widgets.dart';

import 'package:teste_web/flutter_flow/flutter_flow_theme.dart';
import 'package:teste_web/flutter_flow/flutter_flow_util.dart';
import 'package:teste_web/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'option_model.dart';
export 'option_model.dart';

class OptionWidget extends StatefulWidget {
  static const String routName = 'Option Page';
  const OptionWidget({super.key});

  @override
  State<OptionWidget> createState() => _OptionWidgetState();
}

class _OptionWidgetState extends State<OptionWidget> {
  late OptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OptionModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0A0A),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Auto_Aid',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Outfit',
                    color: Colors.white,
                    fontSize: 22,
                    letterSpacing: 0,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: 289,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 0, 8),
                                  child: Text(
                                    'Account Options',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFF57636C),
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 8, 12, 8),
                                  child: InkWell(
                                    onTap: () {},
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, ProfileWidget.routName);
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 0, 0),
                                            child: Icon(
                                              Icons.person_2,
                                              color: Color(0xFF14181B),
                                              size: 20,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    4, 0, 0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${SharedHelper.getUser()["name"]}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    '${SharedHelper.getUser()["email"]}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF4B39EF),
                                                          fontSize: 12,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFE0E3E7),
                                ),
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeInOut,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: _model.mouseRegionHovered1!
                                          ? Color(0xFFF1F4F8)
                                          : Colors.white,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 8, 0, 8),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, CarinfoWidget.routName);
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 0, 0),
                                              child: Icon(
                                                Icons.directions_car_outlined,
                                                color: Color(0xFF14181B),
                                                size: 20,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 0, 0),
                                                child: Text(
                                                  'Car Info',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color:
                                                            Color(0xFF14181B),
                                                        fontSize: 14,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered1 = true);
                                  }),
                                  onExit: ((event) async {
                                    setState(() =>
                                        _model.mouseRegionHovered1 = false);
                                  }),
                                ),
                                // MouseRegion(
                                //   opaque: false,
                                //   cursor: SystemMouseCursors.basic ??
                                //       MouseCursor.defer,
                                //   child: AnimatedContainer(
                                //     duration: Duration(milliseconds: 150),
                                //     curve: Curves.easeInOut,
                                //     width: double.infinity,
                                //     decoration: BoxDecoration(
                                //       color: _model.mouseRegionHovered2!
                                //           ? Color(0xFFF1F4F8)
                                //           : Colors.white,
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(
                                //           0, 8, 0, 8),
                                //       child: InkWell(
                                //         onTap: () {
                                //           Navigator.pushNamed(
                                //               context, RequestsWidget.routName);
                                //         },
                                //         child: Row(
                                //           mainAxisSize: MainAxisSize.max,
                                //           children: [
                                //             Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(12, 0, 0, 0),
                                //               child: Icon(
                                //                 Icons.watch_later_outlined,
                                //                 color: Color(0xFF14181B),
                                //                 size: 20,
                                //               ),
                                //             ),
                                //             Expanded(
                                //               child: Padding(
                                //                 padding: EdgeInsetsDirectional
                                //                     .fromSTEB(12, 0, 0, 0),
                                //                 child: Text(
                                //                   'My  Requests',
                                //                   style: FlutterFlowTheme.of(
                                //                           context)
                                //                       .bodyMedium
                                //                       .override(
                                //                         fontFamily:
                                //                             'Plus Jakarta Sans',
                                //                         color:
                                //                             Color(0xFF14181B),
                                //                         fontSize: 14,
                                //                         letterSpacing: 0,
                                //                         fontWeight:
                                //                             FontWeight.w500,
                                //                       ),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                //   onEnter: ((event) async {
                                //     setState(() =>
                                //         _model.mouseRegionHovered2 = true);
                                //   }),
                                //   onExit: ((event) async {
                                //     setState(() =>
                                //         _model.mouseRegionHovered2 = false);
                                //   }),
                                // ),
                                // MouseRegion(
                                //   opaque: false,
                                //   cursor: SystemMouseCursors.click ??
                                //       MouseCursor.defer,
                                //   child: AnimatedContainer(
                                //     duration: Duration(milliseconds: 150),
                                //     curve: Curves.easeInOut,
                                //     width: double.infinity,
                                //     decoration: BoxDecoration(
                                //       color: _model.mouseRegionHovered3!
                                //           ? Color(0xFFF1F4F8)
                                //           : Colors.white,
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(
                                //           0, 8, 0, 8),
                                //       child: InkWell(
                                //         onTap: () {
                                //           Navigator.pushNamed(
                                //               context, WalletWidget.routName);
                                //         },
                                //         child: Row(
                                //           mainAxisSize: MainAxisSize.max,
                                //           children: [
                                //             Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(12, 0, 0, 0),
                                //               child: Icon(
                                //                 Icons.account_balance_wallet,
                                //                 color: Color(0xFF14181B),
                                //                 size: 20,
                                //               ),
                                //             ),
                                //             Expanded(
                                //               child: Padding(
                                //                 padding: EdgeInsetsDirectional
                                //                     .fromSTEB(12, 0, 0, 0),
                                //                 child: Text(
                                //                   'Wallet',
                                //                   style: FlutterFlowTheme.of(
                                //                           context)
                                //                       .bodyMedium
                                //                       .override(
                                //                         fontFamily:
                                //                             'Plus Jakarta Sans',
                                //                         color:
                                //                             Color(0xFF14181B),
                                //                         fontSize: 14,
                                //                         letterSpacing: 0,
                                //                         fontWeight:
                                //                             FontWeight.w500,
                                //                       ),
                                //                 ),
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                //   onEnter: ((event) async {
                                //     setState(() =>
                                //         _model.mouseRegionHovered3 = true);
                                //   }),
                                //   onExit: ((event) async {
                                //     setState(() =>
                                //         _model.mouseRegionHovered3 = false);
                                //   }),
                                // ),

                                Divider(
                                  thickness: 1,
                                  color: Color(0xFFE0E3E7),
                                ),
                                // MouseRegion(
                                //   opaque: false,
                                //   cursor: SystemMouseCursors.click ??
                                //       MouseCursor.defer,
                                //   child: AnimatedContainer(
                                //     duration: Duration(milliseconds: 150),
                                //     curve: Curves.easeInOut,
                                //     width: double.infinity,
                                //     decoration: BoxDecoration(
                                //       color: _model.mouseRegionHovered4!
                                //           ? Color(0xFFF1F4F8)
                                //           : Colors.white,
                                //     ),
                                //     child: Padding(
                                //       padding: EdgeInsetsDirectional.fromSTEB(
                                //           0, 8, 0, 8),
                                //       child: Row(
                                //         mainAxisSize: MainAxisSize.max,
                                //         children: [
                                //           Padding(
                                //             padding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     12, 0, 0, 0),
                                //             child: Icon(
                                //               Icons.notifications,
                                //               color: Color(0xFF14181B),
                                //               size: 20,
                                //             ),
                                //           ),
                                //           Expanded(
                                //             child: Padding(
                                //               padding: EdgeInsetsDirectional
                                //                   .fromSTEB(12, 0, 0, 0),
                                //               child: Text(
                                //                 'Notfication',
                                //                 style:
                                //                     FlutterFlowTheme.of(context)
                                //                         .bodyMedium
                                //                         .override(
                                //                           fontFamily:
                                //                               'Plus Jakarta Sans',
                                //                           color:
                                //                               Color(0xFF14181B),
                                //                           fontSize: 14,
                                //                           letterSpacing: 0,
                                //                           fontWeight:
                                //                               FontWeight.w500,
                                //                         ),
                                //               ),
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ),
                                //   onEnter: ((event) async {
                                //     setState(() =>
                                //         _model.mouseRegionHovered4 = true);
                                //   }),
                                //   onExit: ((event) async {
                                //     setState(() =>
                                //         _model.mouseRegionHovered4 = false);
                                //   }),
                                // ),
                              ],
                            ),
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   decoration: BoxDecoration(
                          //     color: Colors.white,
                          //   ),
                          //   child: Padding(
                          //     padding:
                          //         EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                          //     child: Row(
                          //       mainAxisSize: MainAxisSize.max,
                          //       children: [
                          //         Padding(
                          //           padding: EdgeInsetsDirectional.fromSTEB(
                          //               12, 0, 0, 0),
                          //           child: Icon(
                          //             Icons.language_sharp,
                          //             color: Color(0xFF14181B),
                          //             size: 20,
                          //           ),
                          //         ),
                          //         Expanded(
                          //           child: Padding(
                          //             padding: EdgeInsetsDirectional.fromSTEB(
                          //                 12, 0, 0, 0),
                          //             child: Text(
                          //               'Change Language',
                          //               style: FlutterFlowTheme.of(context)
                          //                   .bodyMedium
                          //                   .override(
                          //                     fontFamily: 'Plus Jakarta Sans',
                          //                     color: Color(0xFF14181B),
                          //                     fontSize: 14,
                          //                     letterSpacing: 0,
                          //                     fontWeight: FontWeight.w500,
                          //                   ),
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),

                          //
                          MouseRegion(
                            opaque: false,
                            cursor:
                                SystemMouseCursors.basic ?? MouseCursor.defer,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.mouseRegionHovered5!
                                    ? Color(0xFFF1F4F8)
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ComplainWidget.routName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Icon(
                                          Icons.topic,
                                          color: Color(0xFF14181B),
                                          size: 20,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'Make Complaints',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered5 = true);
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered5 = false);
                            }),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.mouseRegionHovered6!
                                    ? Color(0xFFF1F4F8)
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: InkWell(
                                  onTap: () {
                                    SharedHelper.logout().then((value) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          LoginWidget.routName,
                                          (route) => false);
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Icon(
                                          Icons.delete_forever_sharp,
                                          color: Color(0xFF14181B),
                                          size: 20,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'Delete Account',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered6 = true);
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered6 = false);
                            }),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE0E3E7),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 0, 8),
                            child: Text(
                              'Platform',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.mouseRegionHovered7!
                                    ? Color(0xFFF1F4F8)
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 0, 0),
                                      child: Icon(
                                        Icons.help_outline_rounded,
                                        color: Color(0xFF14181B),
                                        size: 20,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Text(
                                          'Help Center',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF14181B),
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered7 = true);
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered7 = false);
                            }),
                          ),
                          MouseRegion(
                            opaque: false,
                            cursor:
                                SystemMouseCursors.click ?? MouseCursor.defer,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 150),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: _model.mouseRegionHovered8!
                                    ? Color(0xFFF1F4F8)
                                    : Colors.white,
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, SosWidget.routName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 0, 0, 0),
                                        child: Icon(
                                          Icons.sos,
                                          color: Color(0xFF14181B),
                                          size: 20,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 0),
                                          child: Text(
                                            'SOS',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  color: Color(0xFF14181B),
                                                  fontSize: 14,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onEnter: ((event) async {
                              setState(() => _model.mouseRegionHovered8 = true);
                            }),
                            onExit: ((event) async {
                              setState(
                                  () => _model.mouseRegionHovered8 = false);
                            }),
                          ),
                          Divider(
                            thickness: 1,
                            color: Color(0xFFE0E3E7),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                                signOut();
                              },
                              text: 'Logout',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 40,
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                iconPadding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF14181B),
                                      fontSize: 16,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Color(0xFFE0E3E7),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signOut() {
    SharedHelper.logout().then((value) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginWidget.routName, (route) => false);
    });
  }
}
