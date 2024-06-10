part of 'request_cubit.dart';

@immutable
sealed class RequestState {}

final class RequestInitial extends RequestState {}


class LoadingMakeRequest extends RequestState{}
class SuccessMakeRequest extends RequestState{}
class ErrorMakeRequest extends RequestState{}