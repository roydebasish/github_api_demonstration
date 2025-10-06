import 'package:equatable/equatable.dart';

class OwnerEntity {
  final int? id;
  final String? login;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? type;
  final String? siteAdmin;

  const OwnerEntity({
    this.id,
    this.login,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.type,
    this.siteAdmin,
  });
}