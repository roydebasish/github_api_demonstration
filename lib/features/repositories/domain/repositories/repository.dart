import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';

abstract class RepositoryRepository {
  Future<List<RepositoryEntity>> getRepositories({bool forceRefresh = false,String sort});
}
