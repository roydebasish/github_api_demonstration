import 'package:github_api_demonstration/features/repositories/domain/entities/owner.dart';

class RepositoryEntity {
  final int? id;
  final String? name;
  final String? fullName;
  final OwnerEntity? owner;
  final String? description;
  final String? htmlUrl;
  final String? stargazersCount;
  final String? watchersCount;
  final String? forksCount;
  final String? language;
  final String? createdAt;
  final String? updatedAt;
  final String? pushedAt;
  final String? size;
  final String? openIssuesCount;
  final String? archived;
  final String? disabled;
  final String? defaultBranch;

  const RepositoryEntity({
    this.id,
    this.name,
    this.fullName,
    this.owner,
    this.description,
    this.htmlUrl,
    this.stargazersCount,
    this.watchersCount,
    this.forksCount,
    this.language,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.size,
    this.openIssuesCount,
    this.archived,
    this.disabled,
    this.defaultBranch,
  });
}
