import 'package:dio/dio.dart';
import 'package:github_api_demonstration/core/network/dio_client.dart';
import 'package:github_api_demonstration/features/repositories/data/models/repository_model.dart';

class GitHubRemoteDataSource {
  final Dio _dio;

  GitHubRemoteDataSource() : _dio = DioClient.createDio();

  Future<List<RepositoryModel>> fetchFlutterRepositories({
    String query = "flutter",
    String sort = "stars",
    String order = "desc",
    int perPage = 50,
  }) async {
    try {
      final response = await _dio.get(
        "/search/repositories",
        queryParameters: {
          "q": query,
          "sort": sort,
          "order": order,
          "per_page": perPage,
        },
      );

      final data = response.data as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>;

      return items
          .map((json) => RepositoryModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw Exception(
          "Failed to fetch repositories: ${e.message ?? e.type.toString()}");
    }
  }
}
