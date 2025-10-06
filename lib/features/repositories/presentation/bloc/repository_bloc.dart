import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';
import 'package:github_api_demonstration/features/repositories/domain/usecases/get_repositories_usecase.dart';
import 'repository_event.dart';
import 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GetRepositoriesUseCase getRepositoriesUseCase;

  RepositoryBloc(this.getRepositoriesUseCase) : super(const RepositoryState()) {
    on<LoadRepositories>(_onLoadRepositories);
    on<ChangeSortEvent>(_onChangeSort);
  }

  Future<void> _onLoadRepositories(
      LoadRepositories event, Emitter<RepositoryState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final repos = await getRepositoriesUseCase(
        forceRefresh: event.forceRefresh,
        sort: state.currentSort,
      );
      emit(state.copyWith(isLoading: false, repositories: repos));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void _onChangeSort(
    ChangeSortEvent event,
    Emitter<RepositoryState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      final repos = await getRepositoriesUseCase(sort: event.sort);
      final sorted = sortRepositories(repos, sort: event.sort);

      emit(state.copyWith(
        isLoading: false,
        repositories: sorted,
        currentSort: event.sort,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

   List<RepositoryEntity> sortRepositories(
     List<RepositoryEntity> repositories, {
     String sort = "stars"
   }) {
     final sortedRepos = List<RepositoryEntity>.from(repositories);

     switch (sort) {
       case "stars":
        sortedRepos.sort((a, b) {
          final aStars = int.parse(a.stargazersCount ?? "0");
          final bStars = int.parse(b.stargazersCount ?? "0");
          return bStars.compareTo(aStars);
        });
        break;

      case "updated":
        sortedRepos.sort((a, b) {
          final aDate = DateTime.tryParse(a.updatedAt ?? '') ?? DateTime(0);
          final bDate = DateTime.tryParse(b.updatedAt ?? '') ?? DateTime(0);
          return bDate.compareTo(aDate);
        });
        break;
     }

     return sortedRepos;
   }

}
