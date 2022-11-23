part of 'profileb_bloc.dart';

@freezed
class ProfilebState with _$ProfilebState {
  const factory ProfilebState.initial() = _Initial;
  const factory ProfilebState.isLoading() = _IsLoading;
  const factory ProfilebState.isError(String errorMesssage) = _IsError;
  const factory ProfilebState.isSuccess(ProjectResponse projectResponse) = _IsSuccess;
}
