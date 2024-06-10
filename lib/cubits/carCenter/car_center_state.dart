part of 'car_center_cubit.dart';

@immutable
sealed class CarCenterState {}

final class CarCenterInitial extends CarCenterState {}

class LoadingCarCenter extends CarCenterState{}
class SuccessCarCenter extends CarCenterState{}
class ErrorCarCenter extends CarCenterState{}