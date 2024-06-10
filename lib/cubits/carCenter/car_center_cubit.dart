import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'car_center_state.dart';

class CarCenterCubit extends Cubit<CarCenterState> {
  CarCenterCubit() : super(CarCenterInitial());

  static CarCenterCubit get(context) => BlocProvider.of(context);

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> data = [];

  void getCarCenter() async {
    emit(LoadingCarCenter());
    try {
      var res = await firestore.collection("carCenter").get();
      data = res.docs.map((e) => e.data()).toList();
      emit(SuccessCarCenter());
    } catch (e) {
      print(e.toString());
      emit(ErrorCarCenter());
    }
  }
}
