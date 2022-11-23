import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project/data/model/project/project_categories_response.dart';
import 'package:project/data/repository/projectCategories_repository.dart';



part 'profileb_event.dart';
part 'profileb_state.dart';
part 'profileb_bloc.freezed.dart';

class ProfilebBloc extends Bloc<ProfilebEvent, ProfilebState> {
  ProfilebBloc() : super(_Initial());

  ProjectCategoriesRepo _projectCategoriesRepo = ProjectCategoriesRepo();

  @override
  Stream<ProfilebState> mapEventToState(
    ProfilebEvent event,
  ) async* {
    yield* event.map(
      started: (value) async* {},
      getAllUserData: (value) async* {
        yield ProfilebState.isLoading();

        final _result = await _projectCategoriesRepo.getAllUserData();

        yield _result.fold(
          (l) => ProfilebState.isError(l),
          (r) => ProfilebState.isSuccess(r),
        );
      },
    );
  }
}
