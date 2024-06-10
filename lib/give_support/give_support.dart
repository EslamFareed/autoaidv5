import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:autoaidv5/option/option.dart';
import 'package:autoaidv5/profile/profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_drop_down_menu/flutter_drop_down.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:teste_web/flutter_flow/flutter_flow_animations.dart';
import 'package:teste_web/flutter_flow/flutter_flow_theme.dart';
import 'package:teste_web/flutter_flow/flutter_flow_util.dart';
import 'package:teste_web/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../cubits/carInfo/car_info_cubit.dart';
import '../cubits/map/map_cubit.dart';
import 'give_support_model.dart';
export 'give_support_model.dart';

class GivesupportWidget extends StatefulWidget {
  static const String routName = 'Give_support Page';

  const GivesupportWidget({super.key});

  @override
  State<GivesupportWidget> createState() => _GivesupportWidgetState();
}

class _GivesupportWidgetState extends State<GivesupportWidget>
    with TickerProviderStateMixin {
  late GivesupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GivesupportModel());
    _showMap();

    animationsMap.addAll({
      'containerOnPageLoadAnimation1': AnimationInfo(
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
        trigger: AnimationTrigger.onPageLoad,
      ),
      'containerOnPageLoadAnimation2': AnimationInfo(
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
        trigger: AnimationTrigger.onPageLoad,
      ),
      'containerOnPageLoadAnimation3': AnimationInfo(
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
        trigger: AnimationTrigger.onPageLoad,
      ),
      'containerOnPageLoadAnimation4': AnimationInfo(
        effects: [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
        trigger: AnimationTrigger.onPageLoad,
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  _showMap() async {
    MapCubit.get(context).getMap().then((value) {
      MapCubit.get(context).updateMap();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    MapCubit.get(context).controller.dispose();

    super.dispose();
  }

  double distance = 0;
  double duration = 0;

  TextEditingController controller = TextEditingController();

  _calcDistance(requests) async {
    RoadInfo roadInfo = await MapCubit.get(context).controller.drawRoad(
          GeoPoint(
              latitude: MapCubit.get(context).current!.latitude,
              longitude: MapCubit.get(context).current!.longitude),
          GeoPoint(
              latitude: requests["userRequestInfo"]["location"]["lat"],
              longitude: requests["userRequestInfo"]["location"]["long"]),
          roadType: RoadType.car,
          roadOption: const RoadOption(
            roadWidth: 10,
            roadColor: Colors.blue,
            zoomInto: true,
          ),
        );
    distance = roadInfo.distance!;
    duration = roadInfo.duration!;
    setState(() {});
  }

  fire.QueryDocumentSnapshot<Map<String, dynamic>>? requests;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: () {
              Navigator.pushNamed(context, OptionWidget.routName);
              print('Button pressed ...');
            },
            child: const Icon(
              color: Colors.white,
              Icons.menu,
              size: 20,
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(
                      thickness: 1,
                      color: FlutterFlowTheme.of(context).alternate,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProfileWidget.routName);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 6, 0, 6),
                            child: Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image.network(
                                    'https://picsum.photos/seed/626/600',
                                    width: 300,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1, -1),
                                child: Text(
                                  '${SharedHelper.getUser()["name"]}',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0,
                                      ),
                                ),
                              ),
                              // Align(
                              //   alignment: AlignmentDirectional(-1, 0),
                              //   child: Text(
                              //     'Rating : 4.8',
                              //     style: FlutterFlowTheme.of(context)
                              //         .bodyMedium
                              //         .override(
                              //           fontFamily: 'Readex Pro',
                              //           letterSpacing: 0,
                              //         ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<MapCubit, MapState>(
                      builder: (context, state) {
                        if (state is LoadingMapState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return SizedBox(
                          height: MediaQuery.sizeOf(context).height * .3,
                          width: MediaQuery.sizeOf(context).width,
                          child: OSMFlutter(
                            controller: MapCubit.get(context).controller,
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                      child: Text(
                        'Support request ',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0,
                                ),
                      ),
                    ),
                    StreamBuilder<fire.QuerySnapshot<Map<String, dynamic>>>(
                      stream: fire.FirebaseFirestore.instance
                          .collection("requests")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        requests = snapshot.data!.docs
                            .where((element) =>
                                element.data()["status"] == "pending" ||
                                element.data()["status"] == "accepted" ||
                                element.data()["status"] == "arrived" &&
                                    element.data()["providerInfo"]["id"] ==
                                        SharedHelper.getUserId())
                            .firstOrNull;
                        if (requests == null) {
                          return const Center(child: Text("No Requests"));
                        } else {
                          return ListView(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              8,
                              0,
                              44,
                            ),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: [
                              Container(
                                width: 100,
                                decoration: BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4, 12, 4, 0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 2,
                                                color: Color(0x520E151B),
                                                offset: Offset(
                                                  0.0,
                                                  1,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 16, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                // ClipRRect(
                                                //   borderRadius:
                                                //       BorderRadius.circular(12),
                                                //   child: Image.network(
                                                //     'https://images.unsplash.com/photo-1534528741775-53994a69daeb?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw5fHxhdmF0YXIlMjBnaXJsfGVufDB8fHx8MTcxNjA4NDI3MXww&ixlib=rb-4.0.3&q=80&w=1080',
                                                //     width: 92,
                                                //     height: 83,
                                                //     fit: BoxFit.cover,
                                                //   ),
                                                // ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16, 0, 16, 0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 4),
                                                          child: Text(
                                                            '${requests!.data()["userRequestInfo"]["name"]}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize: 17,
                                                                  letterSpacing:
                                                                      0,
                                                                ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            '-${requests!.data()["servcies"][0]["name"]}\n${requests!.data()["userRequestCarInfo"]["model"]}       \n${requests!.data()["userRequestCarInfo"]["plates"]}\n$distance km.\n$duration mins.',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${requests!.data()["servcies"][0]["price"]} EG',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        letterSpacing: 0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'containerOnPageLoadAnimation4']!),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              requests!.data()["status"] == "pending"
                                  ? FFButtonWidget(
                                      onPressed: () async {
                                        Map<String, dynamic> data =
                                            requests!.data();
                                        data["providerCarInfo"] =
                                            CarInfoCubit.get(context).myCarInfo;
                                        data["status"] = "accepted";
                                        data["providerInfo"] = {
                                          "id": SharedHelper.getUserId(),
                                          "name":
                                              SharedHelper.getUser()["name"],
                                          "phone":
                                              SharedHelper.getUser()["phone"],
                                          "email":
                                              SharedHelper.getUser()["email"],
                                          "location": {
                                            "lat": MapCubit.get(context)
                                                .current!
                                                .latitude,
                                            "long": MapCubit.get(context)
                                                .current!
                                                .longitude,
                                          }
                                        };
                                        await fire.FirebaseFirestore.instance
                                            .collection("requests")
                                            .doc(requests!.id)
                                            .update(data);
                                        _calcDistance(requests);

                                        await MapCubit.get(context)
                                            .controller
                                            .addMarker(
                                              GeoPoint(
                                                latitude:
                                                    requests!["userRequestInfo"]
                                                        ["location"]["lat"],
                                                longitude:
                                                    requests!["userRequestInfo"]
                                                        ["location"]["long"],
                                              ),
                                              markerIcon: const MarkerIcon(
                                                icon: Icon(
                                                  Icons
                                                      .location_history_rounded,
                                                  color: Colors.red,
                                                  size: 48,
                                                ),
                                              ),
                                            );
                                      },
                                      text: 'Accpet Request',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 55,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 0, 24, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: const Color.fromARGB(
                                            255, 3, 252, 3),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 0,
                                            ),
                                        elevation: 3,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )
                                  : SizedBox(),
                              const SizedBox(height: 20),
                              requests!.data()["status"] == "pending"
                                  ? FFButtonWidget(
                                      onPressed: () async {
                                        Map<String, dynamic> data =
                                            requests!.data();
                                        data["providerInfo"] = {};
                                        var providers = await fire
                                            .FirebaseFirestore.instance
                                            .collection("users")
                                            .where("status", isEqualTo: true)
                                            .get();

                                        var prov = providers.docs.first;
                                        data["providerInfo"] = {
                                          "id": prov.id,
                                          "name": prov.data()["name"],
                                          "phone": prov.data()["phone"],
                                          "email": prov.data()["email"],
                                          "location": {
                                            "lat": 0.0,
                                            "long": 0.0,
                                          }
                                        };
                                        await fire.FirebaseFirestore.instance
                                            .collection("requests")
                                            .doc(requests!.id)
                                            .update(data);
                                        Navigator.pop(context);
                                      },
                                      text: 'Refuse',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 55,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 0, 24, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: Color.fromARGB(255, 165, 11, 11),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 0,
                                            ),
                                        elevation: 3,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )
                                  : SizedBox(),
                              requests!.data()["status"] == "accepted"
                                  ? FFButtonWidget(
                                      onPressed: () async {
                                        Map<String, dynamic> data =
                                            requests!.data();
                                        data["status"] = "arrived";
                                        await fire.FirebaseFirestore.instance
                                            .collection("requests")
                                            .doc(requests!.id)
                                            .update(data);
                                      },
                                      text: 'Arrived',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 55,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 0, 24, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: Color.fromARGB(255, 165, 11, 11),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 0,
                                            ),
                                        elevation: 3,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )
                                  : SizedBox(),
                              requests!.data()["status"] == "arrived"
                                  ? FFButtonWidget(
                                      onPressed: () async {
                                        List<Map<String, dynamic>> serv = [];
                                        print(serv);
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (ctx) {
                                            return MultiSelectBottomSheet(
                                              items: MapCubit.get(context)
                                                  .services
                                                  .map((e) => MultiSelectItem(
                                                      e, e["name"]))
                                                  .toList(),
                                              initialValue: serv,
                                              onConfirm: (values) {
                                                serv = values;
                                              },
                                              maxChildSize: 0.8,
                                            );
                                          },
                                        );
                                        double total = 0;
                                        for (var element in serv) {
                                          total += double.parse(
                                              element["price"].toString());
                                        }

                                        await showModalBottomSheet(
                                          context: context,
                                          builder: (ctx) {
                                            return Container(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    controller: controller,
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Please Enter Some Notes About This Support"),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Finish"),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );

                                        Map<String, dynamic> data =
                                            requests!.data();
                                        data["status"] = "finished";
                                        data["totalCost"] = total.toString();
                                        data["note"] = controller.text;
                                        data["servcies"] = serv;
                                        await fire.FirebaseFirestore.instance
                                            .collection("requests")
                                            .doc(requests!.id)
                                            .update(data);

                                        Navigator.pop(context);
                                      },
                                      text: 'Finished',
                                      options: FFButtonOptions(
                                        width: 300,
                                        height: 55,
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24, 0, 24, 0),
                                        iconPadding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 0),
                                        color: Color.fromARGB(255, 165, 11, 11),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                              fontSize: 20,
                                              letterSpacing: 0,
                                            ),
                                        elevation: 3,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    )
                                  : SizedBox(),
                              const SizedBox(height: 20)
                            ],
                          );
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
