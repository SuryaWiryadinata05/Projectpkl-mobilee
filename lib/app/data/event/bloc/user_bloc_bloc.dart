import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project/data/repository/user_repository.dart';
import 'package:project/screen/login/auth/models/login_response.dart';


part 'user_bloc_event.dart';
part 'user_bloc_state.dart';
part 'user_bloc_bloc.freezed.dart';

class UserBlocBloc extends Bloc<UserBlocEvent, UserBlocState> {
  UserBlocBloc() : super(_Initial()) {
    UserRepository _userRepository = UserRepository();

    @override
    Stream<UserBlocState> mapEventToState(
      UserBlocEvent event,
    ) async* {
      yield* event.map(
        started: (value) async* {},
        getAllUserData: (value) async* {
          yield const UserBlocState.isLoading();
          // Get data Api
          final _result = await _userRepository.getAllUserData(
              loginresponse: LoginResponse());
          // If Data Error yield Error state
          // If Data Success yield Data Success
          yield _result.fold(
            (l) => UserBlocState.isError(l),
            (r) => UserBlocState.isSuccess(r),
          );
        },
      );
    }
  }
}
