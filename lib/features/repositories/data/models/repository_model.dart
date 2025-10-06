import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';

import 'owner_model.dart';

class RepositoryModel extends RepositoryEntity {
  const RepositoryModel({
    super.id,
    super.name,
    super.fullName,
    super.owner,
    super.description,
    super.htmlUrl,
    super.stargazersCount,
    super.watchersCount,
    super.forksCount,
    super.language,
    super.createdAt,
    super.updatedAt,
    super.pushedAt,
    super.size,
    super.openIssuesCount,
    super.archived,
    super.disabled,
    super.defaultBranch,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json['id'] as int?,
      name: json['name']?.toString(),
      fullName: json['full_name']?.toString(),
      owner: json['owner'] != null ? OwnerModel.fromJson(json['owner']) : null,
      description: json['description']?.toString(),
      htmlUrl: json['html_url']?.toString(),
      stargazersCount: json['stargazers_count']?.toString(),
      watchersCount: json['watchers_count']?.toString(),
      forksCount: json['forks_count']?.toString(),
      language: json['language']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      pushedAt: json['pushed_at']?.toString(),
      size: json['size']?.toString(),
      openIssuesCount: json['open_issues_count']?.toString(),
      archived: json['archived']?.toString(),
      disabled: json['disabled']?.toString(),
      defaultBranch: json['default_branch']?.toString(),
    );
  }

  /// Factory for DB row
  factory RepositoryModel.fromDb(Map<String, dynamic> map) {
    return RepositoryModel(
      id: map['id'] as int?,
      name: map['name']?.toString(),
      fullName: map['full_name']?.toString(),
      owner: map['owner_id'] != null
          ? OwnerModel(
              id: map['owner_id'] as int?,
              login: map['login']?.toString(),
              avatarUrl: map['avatar_url']?.toString(),
              gravatarId: map['gravatar_id']?.toString(),
              url: map['url']?.toString(),
              htmlUrl: map['html_url']?.toString(),
              type: map['type']?.toString(),
              siteAdmin: map['site_admin']?.toString(),
            )
          : null,
      description: map['description']?.toString(),
      htmlUrl: map['html_url']?.toString(),
      stargazersCount: map['stargazers_count']?.toString(),
      watchersCount: map['watchers_count']?.toString(),
      forksCount: map['forks_count']?.toString(),
      language: map['language']?.toString(),
      createdAt: map['created_at']?.toString(),
      updatedAt: map['updated_at']?.toString(),
      pushedAt: map['pushed_at']?.toString(),
      size: map['size']?.toString(),
      openIssuesCount: map['open_issues_count']?.toString(),
      archived: map['archived']?.toString(),
      disabled: map['disabled']?.toString(),
      defaultBranch: map['default_branch']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "owner": owner != null ? (owner as OwnerModel).toJson() : null,
        "description": description,
        "html_url": htmlUrl,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "forks_count": forksCount,
        "language": language,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pushed_at": pushedAt,
        "size": size,
        "open_issues_count": openIssuesCount,
        "archived": archived,
        "disabled": disabled,
        "default_branch": defaultBranch,
      };

  /// For DB insert
  Map<String, dynamic> toJsonDb() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "owner_id": owner?.id,
        "description": description,
        "html_url": htmlUrl,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "forks_count": forksCount,
        "language": language,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "pushed_at": pushedAt,
        "size": size,
        "open_issues_count": openIssuesCount,
        "archived": archived,
        "disabled": disabled,
        "default_branch": defaultBranch,
      };
}