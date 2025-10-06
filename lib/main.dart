import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app.dart';
import 'core/config/app_config.dart';
import 'core/database/database_helper.dart';
import 'core/themes/bloc/theme_bloc.dart';
import 'features/repositories/data/datasources/repository_local_datasource.dart';
import 'features/repositories/data/datasources/repository_remote_datasource.dart';
import 'features/repositories/data/repositories/repository_impl.dart';
import 'features/repositories/domain/usecases/get_repositories_usecase.dart';
import 'features/repositories/presentation/bloc/repository_bloc.dart';
import 'features/repositories/presentation/bloc/repository_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize("dev");
  await DatabaseHelper.initialize();

  // Initialize dependencies
  final repoRepository = RepositoryRepositoryImpl(
    GitHubRemoteDataSource(),
    GitHubLocalDataSource(),
  );
  final getRepositoriesUseCase = GetRepositoriesUseCase(repoRepository);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => RepositoryBloc(getRepositoriesUseCase)..add(LoadRepositories()),
        ),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: const MyApp(),
    ),
  );
}
