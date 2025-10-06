import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_api_demonstration/features/repositories/presentation/pages/repository_list_screen.dart';
import 'core/themes/app_themes.dart';
import 'core/themes/bloc/theme_bloc.dart';
import 'core/themes/bloc/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
   Widget build(BuildContext context) {
     return BlocBuilder<ThemeBloc, ThemeState>(
       builder: (context, state) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: AppThemes.lightTheme,
           darkTheme: AppThemes.darkTheme,
           themeMode: state.themeMode,
           home: const RepositoryListPage(),
         );
       },
     );
  }
}