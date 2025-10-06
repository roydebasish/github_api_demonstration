abstract class RepositoryEvent {}

class LoadRepositories extends RepositoryEvent {
  final bool forceRefresh;

  LoadRepositories({this.forceRefresh = false});
}

class ChangeSortEvent extends RepositoryEvent {
  final String sort;  // "stars" or "updated"
  final String order; // "asc" or "desc"

  ChangeSortEvent({required this.sort, required this.order});
}
