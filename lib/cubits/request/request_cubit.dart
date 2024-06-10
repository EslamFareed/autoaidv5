import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:autoaidv5/cubits/carInfo/car_info_cubit.dart';
import 'package:autoaidv5/cubits/map/map_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'request_state.dart';

class RequestCubit extends Cubit<RequestState> {
  RequestCubit() : super(RequestInitial());

  static RequestCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic>? value;

  String? requestId;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  void makeRequest(BuildContext context) async {
    emit(LoadingMakeRequest());

    try {
      var providers = await firestore
          .collection("users")
          .where("status", isEqualTo: true)
          .get();

      var prov = providers.docs.first;

      var data = await firestore.collection("requests").add({
        "servcies": [
          value,
        ],
        "note": "",
        "totalCost": value!["price"],
        "userRequestInfo": {
          "id": SharedHelper.getUserId(),
          "name": SharedHelper.getUser()["name"],
          "phone": SharedHelper.getUser()["phone"],
          "email": SharedHelper.getUser()["email"],
          "location": {
            "lat": MapCubit.get(context).current!.latitude,
            "long": MapCubit.get(context).current!.longitude,
          }
        },
        "userRequestCarInfo": CarInfoCubit.get(context).myCarInfo,
        "status": "pending",
        "isPaid": false,
        "providerInfo": {
          "id": prov.id,
          "name": prov.data()["name"],
          "phone": prov.data()["phone"],
          "email": prov.data()["email"],
          "location": {
            "lat": 0.0,
            "long": 0.0,
          }
        },
        "providerCarInfo": {},
      });

      await SharedHelper.setHaveRequest(data.id);
      emit(SuccessMakeRequest());
    } catch (e) {
      print(e.toString());
      emit(ErrorMakeRequest());
    }
  }
}
