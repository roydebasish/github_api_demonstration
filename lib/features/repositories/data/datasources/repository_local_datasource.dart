import 'package:github_api_demonstration/core/database/database_helper.dart';
import 'package:github_api_demonstration/features/repositories/data/models/repository_model.dart';

class GitHubLocalDataSource {
  Future<void> cacheRepositories(List<RepositoryModel> repos) async {
    await DatabaseHelper.insertRepositories(repos);
  }

  Future<List<RepositoryModel>> getCachedRepositories() async {
    return await DatabaseHelper.getRepositories();
  }
}
