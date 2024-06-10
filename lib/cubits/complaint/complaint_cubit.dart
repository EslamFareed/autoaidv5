import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'complaint_state.dart';

class ComplaintCubit extends Cubit<ComplaintState> {
  ComplaintCubit() : super(ComplaintInitial());
  static ComplaintCubit get(context) => BlocProvider.of(context);

  void make(String note) async {
    emit(LoadingMakeComplaintState());
    try {
      await FirebaseFirestore.instance
          .collection("complaints")
          .add({"text": note, "user": SharedHelper.getUser()});
      emit(SuccessMakeComplaintState());
    } catch (e) {
      print(e.toString());
      emit(ErrorMakeComplaintState());
    }
  }
}
