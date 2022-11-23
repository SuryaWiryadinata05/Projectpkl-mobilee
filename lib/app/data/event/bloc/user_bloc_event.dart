part of 'user_bloc_bloc.dart';

@freezed
class UserBlocEvent with _$UserBlocEvent{
    const factory UserBlocEvent.started() = _Started;
    const factory UserBlocEvent.getAllUserData() = _GetAllUserData;
}
