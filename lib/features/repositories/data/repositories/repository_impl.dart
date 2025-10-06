import 'package:github_api_demonstration/features/repositories/data/datasources/repository_local_datasource.dart';
import 'package:github_api_demonstration/features/repositories/data/datasources/repository_remote_datasource.dart';
import 'package:github_api_demonstration/features/repositories/data/models/repository_model.dart';
import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';
import 'package:github_api_demonstration/features/repositories/domain/repositories/repository.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final GitHubRemoteDataSource remoteDataSource;
  final GitHubLocalDataSource localDataSource;

  RepositoryRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<RepositoryEntity>> getRepositories({bool forceRefresh = false, String sort = "stars"}) async {
    if (forceRefresh) {
      final repos = await remoteDataSource.fetchFlutterRepositories(sort: sort);
      await localDataSource.cacheRepositories(repos);
      return repos;
    } else {
      final cached = await localDataSource.getCachedRepositories();
      if (cached.isNotEmpty) return cached;
      final repos = await remoteDataSource.fetchFlutterRepositories();
      await localDataSource.cacheRepositories(repos);
      return repos;
    }
  }
}
