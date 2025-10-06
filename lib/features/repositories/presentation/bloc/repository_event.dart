import 'package:equatable/equatable.dart';

abstract class RepositoryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadRepositories extends RepositoryEvent {
  final bool forceRefresh;

  LoadRepositories({this.forceRefresh = false});
}
