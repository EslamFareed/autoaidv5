import 'package:autoaidv5/Login/login.dart';
import 'package:autoaidv5/Services/shared_helper.dart';
import 'package:autoaidv5/car_centers/car_centers.dart';
import 'package:autoaidv5/change_password/change_password.dart';
import 'package:autoaidv5/complaint/complaint.dart';
import 'package:autoaidv5/cubits/auth/auth_cubit.dart';
import 'package:autoaidv5/cubits/carCenter/car_center_cubit.dart';
import 'package:autoaidv5/cubits/carInfo/car_info_cubit.dart';
import 'package:autoaidv5/cubits/complaint/complaint_cubit.dart';
import 'package:autoaidv5/cubits/request/request_cubit.dart';
import 'package:autoaidv5/delete_account/delete_account.dart';
import 'package:autoaidv5/edit_profile/edit_profile.dart';
import 'package:autoaidv5/forgot_password/forgot_password.dart';
import 'package:autoaidv5/forgot_password/forgot_password_model.dart';
import 'package:autoaidv5/give_support/give_support.dart';
import 'package:autoaidv5/home/home.dart';
import 'package:autoaidv5/option/option.dart';
import 'package:autoaidv5/payment_method/payment_method.dart';
import 'package:autoaidv5/profile/profile.dart';
import 'package:autoaidv5/quick_support/quick_support.dart';
import 'package:autoaidv5/requests/requests.dart';
import 'package:autoaidv5/sos/sos.dart';
import 'package:autoaidv5/start/start.dart';
import 'package:autoaidv5/support/support.dart';
import 'package:autoaidv5/support_brief/support_brief.dart';
import 'package:autoaidv5/tow_trucks/tow_trucks.dart';
import 'package:autoaidv5/visa/visa.dart';
import 'package:autoaidv5/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'car_info/car_info.dart';
import 'cubits/map/map_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CarCenterCubit()),
        BlocProvider(create: (context) => RequestCubit()),
        BlocProvider(create: (context) => ComplaintCubit()),
        BlocProvider(create: (context) => MapCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => CarInfoCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          LoginWidget.routName: (_) => LoginWidget(),
          CarinfoWidget.routName: (_) => CarinfoWidget(),
          WalletWidget.routName: (_) => WalletWidget(),
          ComplainWidget.routName: (_) => ComplainWidget(),
          SosWidget.routName: (_) => SosWidget(),
          OptionWidget.routName: (_) => OptionWidget(),
          DeletaccountWidget.routName: (_) => DeletaccountWidget(),
          HomeWidget.routName: (_) => HomeWidget(),
          SupportWidget.routName: (_) => SupportWidget(),
          CarCentersWidget.routName: (_) => CarCentersWidget(),
          RequestsWidget.routName: (_) => RequestsWidget(),
          StartWidget.routName: (_) => StartWidget(),
          GivesupportWidget.routName: (_) => GivesupportWidget(),
          SupportbreifWidget.routName: (_) => SupportbreifWidget(),
          ProfileWidget.routName: (_) => ProfileWidget(),
          TowTrucksWidget.routName: (_) => TowTrucksWidget(),
          EditprofileWidget.routName: (_) => EditprofileWidget(),
          QuickSupportWidget.routName: (_) => QuickSupportWidget(),
          ForgotPasswordWidget.routName: (_) => ForgotPasswordWidget(),
          ChangePasswordWidget.routName: (_) => ChangePasswordWidget(),
          PaymentMethodWidget.routName: (_) => PaymentMethodWidget(),
          VisaWidget.routName: (_) => VisaWidget(),
        },
        initialRoute:
            SharedHelper.isLogin() ? HomeWidget.routName : LoginWidget.routName,
      ),
    );
  }
}
