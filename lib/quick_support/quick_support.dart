// import 'package:teste_web/flutter_flow/flutter_flow_drop_down.dart';

import 'package:autoaidv5/common%20widgets/customDropButton.dart';
import 'package:autoaidv5/cubits/map/map_cubit.dart';
import 'package:autoaidv5/cubits/request/request_cubit.dart';
import 'package:flutter/material.dart';
import 'package:autoaidv5/support/support.dart';
import 'package:autoaidv5/support_brief/support_brief.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drop_down_menu/flutter_drop_down.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:teste_web/flutter_flow/flutter_flow_theme.dart';
import 'package:teste_web/flutter_flow/flutter_flow_util.dart';
import 'package:teste_web/flutter_flow/flutter_flow_widgets.dart';
import 'package:teste_web/flutter_flow/form_field_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import 'quick_support_model.dart';
export 'quick_support_model.dart';

class QuickSupportWidget extends StatefulWidget {
  static const String routName = 'Quick_support Page';

  const QuickSupportWidget({super.key});

  @override
  State<QuickSupportWidget> createState() => _QuickSupportWidgetState();
}

class _QuickSupportWidgetState extends State<QuickSupportWidget> {
  late QuickSupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _showMap();

    _model = createModel(context, () => QuickSupportModel());
  }

  _showMap() async {
    MapCubit.get(context).getMap().then((value) {
      MapCubit.get(context).updateMap();
    });
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.

  @override
  void dispose() {
    _model.dispose();
    MapCubit.get(context).controller.dispose();

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                        child: PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BlocBuilder<MapCubit, MapState>(
                                    builder: (context, state) {
                                      if (state is LoadingMapState) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                      return Expanded(
                                        child: OSMFlutter(
                                          controller:
                                              MapCubit.get(context).controller,
                                          osmOption: OSMOption(
                                            zoomOption: const ZoomOption(
                                              initZoom: 14,
                                              minZoomLevel: 3,
                                              maxZoomLevel: 19,
                                              stepZoom: 1.0,
                                            ),
                                            roadConfiguration: const RoadOption(
                                              roadColor: Colors.yellowAccent,
                                            ),
                                            markerOption: MarkerOption(
                                              defaultMarker: const MarkerIcon(
                                                icon: Icon(
                                                  Icons.person_pin_circle,
                                                  color: Colors.blue,
                                                  size: 56,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // Expanded(
                                  //   child: Padding(
                                  //     padding: EdgeInsetsDirectional.fromSTEB(
                                  //         0, 0, 0, 12),
                                  //     child: ClipRRect(
                                  //       borderRadius: BorderRadius.circular(12),
                                  //       child: Image.network(
                                  //         'https://images.unsplash.com/photo-1678132852119-c03c2e7d2740?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60',
                                  //         width: double.infinity,
                                  //         height: 300,
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       12, 0, 0, 0),
                                  //   child: Text(
                                  //     'Your hero is routing your current location',
                                  //     style: FlutterFlowTheme.of(context)
                                  //         .headlineLarge
                                  //         .override(
                                  //           fontFamily: 'Outfit',
                                  //           letterSpacing: 0,
                                  //         ),
                                  //   ),
                                  // ),
                                  Container(
                                      width: 384,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BlocBuilder<MapCubit, MapState>(
                                          builder: (context, state) {
                                            if (state
                                                    is LoadingGetServicesState ||
                                                state is LoadingMapState) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            return DropdownButtonExample(
                                              list: MapCubit.get(context)
                                                  .services,
                                            );
                                          },
                                        ),
                                      )
// DropDownListView(
//         defaultItemIndex: 0,
//         items: ['Tire', 'Fuel', 'Battery cutout', 'Stucked in sand', 'Other'],
//         curve: Curves.ease, // opening or exit animation
//         safeArea: true, // popup will display with safearea, Default: true
//         physics: const NeverScrollableScrollPhysics(), // scrollphysic for popup dropdown menu
//         elevation: 5, // elevation for popup dropdown
//         transitionPerPixel: 0.5, // popup menu duration for each pixel, in other word, control speed of popup menu depend on length
//         iconData: Icons.arrow_drop_down, // icon for dropdown menu
//         dropdownItemBuilder: (BuildContext context, dynamic value, int index, bool isSelected){
//           value:
//             // value => value of specific item
//             // index => index of item
//             // isSelected => true when current index was selected
//             return Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                 child: Text(value, overflow: TextOverflow.ellipsis)
//             );
//         },
//         dropdownButtonBuilder: (context, int index){ // Build dropdown button
//             // index => index give the current selected index;
//             return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 // child: Text('value ${value[index]}', overflow: TextOverflow.ellipsis)
//
//             );
//         },
//         onValueChanged: (value, index){ // this function is optional and will called with selection changed.
//         //    print("value changed $value");
//          },
//     )

                                      )
                                ],
                              ),
//
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            count: 1,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: Duration(milliseconds: 0),
                                curve: Curves.ease,
                              );
                              setState(() {});
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 2,
                              spacing: 8,
                              radius: 16,
                              dotWidth: 16,
                              dotHeight: 4,
                              dotColor: FlutterFlowTheme.of(context).alternate,
                              activeDotColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                        // print('Button pressed ...');
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 150,
                        height: 50,
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0,
                            ),
                        elevation: 2,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    BlocConsumer<RequestCubit, RequestState>(
                      listener: (context, state) {
                        if (state is SuccessMakeRequest) {
                          Navigator.pushReplacementNamed(
                              context, SupportbreifWidget.routName);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoadingMakeRequest) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return FFButtonWidget(
                          onPressed: () {
                            if (RequestCubit.get(context).value == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Must Choose Service")));
                            } else {
                              RequestCubit.get(context).makeRequest(context);
                            }

                            print('Button pressed ...');
                          },
                          text: 'Confirm',
                          options: FFButtonOptions(
                            width: 150,
                            height: 50,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0,
                                ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
