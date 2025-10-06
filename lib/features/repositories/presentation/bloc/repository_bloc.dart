import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_demonstration/features/repositories/domain/usecases/get_repositories_usecase.dart';
import 'repository_event.dart';
import 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GetRepositoriesUseCase getRepositories;

  RepositoryBloc(this.getRepositories) : super(const RepositoryState()) {
    on<LoadRepositories>(_onLoadRepositories);
  }

  Future<void> _onLoadRepositories(
      LoadRepositories event, Emitter<RepositoryState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final repos = await getRepositories(forceRefresh: event.forceRefresh);
      emit(state.copyWith(isLoading: false, repositories: repos));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
