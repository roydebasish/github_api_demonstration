import 'package:flutter/material.dart';
import 'package:github_api_demonstration/core/utils/app_spacing.dart';
import 'package:github_api_demonstration/core/utils/utils.dart';
import '../../domain/entities/repository.dart';

class RepositoryDetailsScreen extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryDetailsScreen({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(repository.fullName ?? "Repository Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Owner Info
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: repository.owner?.avatarUrl != null
                      ? NetworkImage(repository.owner!.avatarUrl!)
                      : null,
                  child: repository.owner?.avatarUrl == null
                      ? const Icon(Icons.person, size: 30)
                      : null,
                ),
                horizontalSpacing(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        repository.owner?.login ?? "Unknown Owner",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        repository.owner?.type ?? "",
                        style: const TextStyle(
                            color: Colors.blueAccent, fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpacing(20),

            // Repository Name
            Text(
              repository.fullName ?? "No repository name",
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            horizontalSpacing(10),

            // Description
            Text(
              repository.description ?? "No description provided",
              style: const TextStyle(fontSize: 16),
            ),
            verticalSpacing(20),

            // Stats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _statItem(Icons.star, repository.stargazersCount ?? "0"),
                _statItem(Icons.remove_red_eye, repository.watchersCount ?? "0"),
                _statItem(Icons.call_split, repository.forksCount ?? "0"),
                _statItem(Icons.error_outline, repository.openIssuesCount ?? "0"),
              ],
            ),
            verticalSpacing(20),

            // Language
            if ((repository.language ?? "").isNotEmpty)
              Text("Language: ${repository.language}",
                  style: const TextStyle(fontSize: 14)),

            verticalSpacing(12),

            // Last Updated
            Text(
              "Last Updated: ${formatDateTime(repository.updatedAt)}",
              style: const TextStyle(fontSize: 14),
            ),

            horizontalSpacing(10),

            // Created At
            Text(
              "Created At: ${formatDateTime(repository.createdAt)}",
              style: const TextStyle(fontSize: 14),
            ),

            verticalSpacing(12),

            // Default Branch
            Text(
              "Default Branch: ${repository.defaultBranch ?? 'Unknown'}",
              style: const TextStyle(fontSize: 14),
            ),

            verticalSpacing(12),

            // Archived / Disabled
            Text(
              "Archived: ${repository.archived == true ? 'Yes' : 'No'}",
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              "Disabled: ${repository.disabled == true ? 'Yes' : 'No'}",
              style: const TextStyle(fontSize: 14),
            ),

            verticalSpacing(12),

            // Repository URL
            if ((repository.htmlUrl ?? "").isNotEmpty)
              GestureDetector(
                onTap: () {
                  // Implement launch URL if needed
                },
                child: Text(
                  "Repository URL: ${repository.htmlUrl}",
                  style: const TextStyle(
                      color: Colors.blueAccent, fontSize: 14),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(IconData icon, String count) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade700),
        const SizedBox(width: 4),
        Text(count.toString()),
      ],
    );
  }

}
