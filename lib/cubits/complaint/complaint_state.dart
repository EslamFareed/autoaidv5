part of 'complaint_cubit.dart';

@immutable
sealed class ComplaintState {}

final class ComplaintInitial extends ComplaintState {}

class LoadingMakeComplaintState extends ComplaintState{}
class SuccessMakeComplaintState extends ComplaintState{}
class ErrorMakeComplaintState extends ComplaintState{}