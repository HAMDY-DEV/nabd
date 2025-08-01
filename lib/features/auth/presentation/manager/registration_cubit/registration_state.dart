
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class RegistrationSuccess extends RegistrationState {}

final class RegistrationError extends RegistrationState {
  final String message;
  RegistrationError({required this.message});
}


