import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fire;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  static MapCubit get(context) => BlocProvider.of(context);
  late MapController controller;

  Position? current;

  Future<void> showMarker() async {
    await controller.addMarker(
      GeoPoint(
        latitude: current!.latitude,
        longitude: current!.longitude,
      ),
      markerIcon: const MarkerIcon(
        icon: Icon(
          Icons.location_history_rounded,
          color: Colors.red,
          size: 48,
        ),
      ),
    );
    emit(SuccessMapState());
  }

  Future<void> getMap() async {
    emit(LoadingMapState());

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    await Geolocator.getCurrentPosition().then((value) async {
      current = value;
      controller = MapController.withPosition(
        initPosition: GeoPoint(
          latitude: value.latitude,
          longitude: value.longitude,
        ),
      );
    });

    emit(SuccessMapState());
    await Future.delayed(const Duration(seconds: 2), () async {
      await showMarker();
    });
    getServices();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // return await Geolocator.getCurrentPosition();
  }

  fire.FirebaseFirestore firestore = fire.FirebaseFirestore.instance;

  void updateMap() async {
    await controller.removeMarker(
      GeoPoint(
        latitude: current!.latitude,
        longitude: current!.longitude,
      ),
    );
    Geolocator.getPositionStream().listen((event) async {
      current = event;
      controller.goToLocation(
        GeoPoint(
          latitude: event.latitude,
          longitude: event.longitude,
        ),
      );
      await Future.delayed(const Duration(seconds: 1), () async {
        await showMarker();
      });

      emit(UpdateMapState());
    });
  }

  List<Map<String, dynamic>> services = [];
  void getServices() async {
    emit(LoadingGetServicesState());
    try {
      var data = await firestore.collection("services").get();

      services = data.docs.map((e) => e.data()).toList();
      emit(SuccessGetServicesState());
    } catch (e) {
      print(e.toString());
      emit(ErrorGetServicesState());
    }
  }
}
