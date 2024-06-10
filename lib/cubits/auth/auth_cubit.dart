import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void login(String email, String password) async {
    emit(LoadingLoginState());

    try {
      var creden = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (creden.user == null) {
        emit(ErrorLoginState());
      } else {
        var data =
            await firestore.collection("users").doc(creden.user!.uid).get();

        await SharedHelper.login(creden.user!.uid, data.data()!);

        emit(SuccessLoginState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorLoginState());
    }
  }

  void createAccount(String email, String password) async {
    emit(LoadingCreateAccountState());

    try {
      var creden = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (creden.user == null) {
        emit(ErrorCreateAccountState());
      } else {
        Map<String, dynamic> data = {
          "email": email,
          "password": password,
          "name": "no name",
          "phone": "no phone",
          "status": false,
        };
        await firestore.collection("users").doc(creden.user!.uid).set(data);

        await SharedHelper.login(creden.user!.uid, data);

        emit(SuccessCreateAccountState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorCreateAccountState());
    }
  }

  void editProfile(String phone, String name) async {
    emit(LoadingCreateAccountState());

    try {
      Map<String, dynamic> data = {
        "email": SharedHelper.getUser()["email"],
        "password": SharedHelper.getUser()["password"],
        "name": name,
        "phone": phone
      };
      await firestore
          .collection("users")
          .doc(SharedHelper.getUserId())
          .update(data);

      await SharedHelper.login(SharedHelper.getUserId(), data);

      emit(SuccessCreateAccountState());
    } catch (e) {
      print(e.toString());
      emit(ErrorCreateAccountState());
    }
  }
}
