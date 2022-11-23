part of 'user_bloc_bloc.dart';

@freezed
class UserBlocState with _$UserBlocState {
  const factory UserBlocState.initial() = _Initial;
  const factory UserBlocState.isLoading() = _IsLoading;
  const factory UserBlocState.isError(String errorMesssage) = _IsError;
  const factory UserBlocState.isSuccess(LoginResponse loginResponse) = _IsSuccess;
}
