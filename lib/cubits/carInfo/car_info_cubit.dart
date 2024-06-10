import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'car_info_state.dart';

class CarInfoCubit extends Cubit<CarInfoState> {
  CarInfoCubit() : super(CarInfoInitial());

  static CarInfoCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic>? myCarInfo;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void getCar() async {
    emit(LoadingGetCarInfoState());

    try {
      var data =
          await firestore.collection("car").doc(SharedHelper.getUserId()).get();

      myCarInfo = data.data();

      emit(SuccessGetCarInfoState());
    } catch (e) {
      print(e.toString());

      emit(ErrorGetCarInfoState());
    }
  }

  void editCar(String model, String color, String plates) async {
    emit(LoadingEditCarInfoState());

    try {
      await firestore
          .collection("car")
          .doc(SharedHelper.getUserId())
          .set({"model": model, "color": color, "plates": plates});
      myCarInfo = {"model": model, "color": color, "plates": plates};

      emit(SuccessEditCarInfoState());
    } catch (e) {
      print(e.toString());

      emit(ErrorEditCarInfoState());
    }
  }
}
