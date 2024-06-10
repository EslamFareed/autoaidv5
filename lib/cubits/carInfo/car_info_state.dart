part of 'car_info_cubit.dart';

@immutable
sealed class CarInfoState {}

final class CarInfoInitial extends CarInfoState {}


class LoadingGetCarInfoState extends CarInfoState{}
class SuccessGetCarInfoState extends CarInfoState{}
class ErrorGetCarInfoState extends CarInfoState{}



class LoadingEditCarInfoState extends CarInfoState{}
class SuccessEditCarInfoState extends CarInfoState{}
class ErrorEditCarInfoState extends CarInfoState{}