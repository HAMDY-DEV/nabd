sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomePostLoading extends HomeState {}

final class HomePostSuccess extends HomeState {}

final class HomePostError extends HomeState {}

final class CreatorPostLoading extends HomeState {}

final class CreatorPostSuccess extends HomeState {
  Map<String, dynamic> userData;

  CreatorPostSuccess({required this.userData});
}

final class CreatorPostError extends HomeState {}
