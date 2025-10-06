import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';
import 'package:github_api_demonstration/features/repositories/domain/repositories/repository.dart';

class GetRepositoriesUseCase {
  final RepositoryRepository repository;

  GetRepositoriesUseCase(this.repository);

  Future<List<RepositoryEntity>> call({bool forceRefresh = false, String sort = "stars"}) {
    return repository.getRepositories(forceRefresh: forceRefresh,sort: sort);
  }
}
