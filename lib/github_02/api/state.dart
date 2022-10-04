import '../model/github_repository.dart';
import '../views/github_repository_error_panel.dart';

class RepositoryState {
  const RepositoryState();
}

class RepositoryLoadingState extends RepositoryState {
  const RepositoryLoadingState();
}

class RepositoryErrorState extends RepositoryState {
  final ErrorType type;

  const RepositoryErrorState({required this.type});
}

class RepositoryLoadedState extends RepositoryState {
  final List<GithubRepository> data;

  const RepositoryLoadedState({required this.data});
}