import 'package:github_api_demonstration/features/repositories/domain/entities/owner.dart';

class OwnerModel extends OwnerEntity {
  const OwnerModel({
    super.id,
    super.login,
    super.avatarUrl,
    super.gravatarId,
    super.url,
    super.htmlUrl,
    super.type,
    super.siteAdmin,
  });

  factory OwnerModel.fromJson(Map<String, dynamic> json) {
    return OwnerModel(
      id: json['id'] as int?,
      login: json['login']?.toString(),
      avatarUrl: json['avatar_url']?.toString(),
      gravatarId: json['gravatar_id']?.toString(),
      url: json['url']?.toString(),
      htmlUrl: json['html_url']?.toString(),
      type: json['type']?.toString(),
      siteAdmin: json['site_admin']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "login": login,
      "avatar_url": avatarUrl,
      "gravatar_id": gravatarId,
      "url": url,
      "html_url": htmlUrl,
      "type": type,
      "site_admin": siteAdmin,
    };
  }
}