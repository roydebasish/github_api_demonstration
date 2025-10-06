import 'package:equatable/equatable.dart';
import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';

class RepositoryState extends Equatable {
  final List<RepositoryEntity> repositories;
  final bool isLoading;
  final String? error;

  const RepositoryState({
    this.repositories = const [],
    this.isLoading = false,
    this.error,
  });

  RepositoryState copyWith({
    List<RepositoryEntity>? repositories,
    bool? isLoading,
    String? error,
  }) {
    return RepositoryState(
      repositories: repositories ?? this.repositories,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [repositories, isLoading, error];
}
