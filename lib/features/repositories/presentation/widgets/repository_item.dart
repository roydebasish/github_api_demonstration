import 'package:flutter/material.dart';
import 'package:github_api_demonstration/core/utils/app_spacing.dart';
import 'package:github_api_demonstration/core/utils/utils.dart';
import 'package:github_api_demonstration/features/repositories/domain/entities/repository.dart';
import 'package:github_api_demonstration/features/repositories/presentation/pages/repository_details_page.dart';

class RepositoryItem extends StatelessWidget {
  final RepositoryEntity repository;

  const RepositoryItem({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RepositoryDetailsScreen(repository: repository),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.cardColor, // ✅ reacts to theme
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark
                ? Colors.white10
                : Colors.grey.shade300, // ✅ theme adaptive border
          ),
          boxShadow: [
            if (!isDark)
              BoxShadow(
                color: Colors.grey.shade200,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundImage: repository.owner?.avatarUrl != null
                  ? NetworkImage(repository.owner!.avatarUrl!)
                  : null,
              child: repository.owner?.avatarUrl == null
                  ? const Icon(Icons.person)
                  : null,
            ),
            horizontalSpacing(12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Repo name
                  Text(
                    repository.fullName ?? "No name",
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(5),

                  // Description
                  Text(
                    repository.description ?? "No description available",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  verticalSpacing(8),

                  // Stars & Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            repository.stargazersCount?.toString() ?? '0',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        formatDateTime(repository.updatedAt),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}