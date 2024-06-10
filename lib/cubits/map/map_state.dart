part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}


class ChangeLocationState extends MapState{}

class LoadingMapState extends MapState{}
class SuccessMapState extends MapState{}
class UpdateMapState extends MapState{}




class LoadingGetServicesState extends MapState{}
class SuccessGetServicesState extends MapState{}
class ErrorGetServicesState extends MapState{}



