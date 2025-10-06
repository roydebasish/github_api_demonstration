import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_demonstration/core/themes/bloc/theme_bloc.dart';
import 'package:github_api_demonstration/core/themes/bloc/theme_event.dart';
import 'package:github_api_demonstration/features/repositories/presentation/bloc/repository_bloc.dart';
import 'package:github_api_demonstration/features/repositories/presentation/bloc/repository_event.dart';
import 'package:github_api_demonstration/features/repositories/presentation/bloc/repository_state.dart';
import 'package:github_api_demonstration/features/repositories/presentation/widgets/repository_item.dart';

class RepositoryListPage extends StatelessWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Flutter Repositories"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context
                .read<RepositoryBloc>()
                .add(LoadRepositories(forceRefresh: true)),
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
          ),
        ],
      ),
      body: BlocBuilder<RepositoryBloc, RepositoryState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text("Error: ${state.error}"));
          } else if (state.repositories.isEmpty) {
            return const Center(child: Text("No repositories found"));
          }
          return ListView.builder(
            itemCount: state.repositories.length,
            itemBuilder: (context, index) {
              final repo = state.repositories[index];
              return RepositoryItem(repository: repo);
            },
          );
        },
      ),
    );
  }
}
