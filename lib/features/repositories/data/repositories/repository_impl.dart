import 'package:github_api_demonstration/features/repositories/data/datasources/repository_local_datasource.dart';
import 'package:github_api_demonstration/features/repositories/data/datasources/repository_remote_datasource.dart';
import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';
import 'package:github_api_demonstration/features/repositories/domain/repositories/repository.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final GitHubRemoteDataSource remote;
  final GitHubLocalDataSource local;

  RepositoryRepositoryImpl(this.remote, this.local);

  @override
  Future<List<RepositoryEntity>> getRepositories({bool forceRefresh = false}) async {
    if (forceRefresh) {
      final repos = await remote.fetchFlutterRepositories();
      await local.cacheRepositories(repos);
      return repos;
    } else {
      final cached = await local.getCachedRepositories();
      if (cached.isNotEmpty) return cached;
      final repos = await remote.fetchFlutterRepositories();
      await local.cacheRepositories(repos);
      return repos;
    }
  }
}
