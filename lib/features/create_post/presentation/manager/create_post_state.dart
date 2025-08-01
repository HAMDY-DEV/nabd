
sealed class CreatePostState {}

final class CreatePostInitial extends CreatePostState {}

final class CreatePostSuccess extends CreatePostState {}

final class CreatePostError extends CreatePostState {}

final class CreatePostLoading extends CreatePostState {}

final class ChangePhoto extends CreatePostState {}
