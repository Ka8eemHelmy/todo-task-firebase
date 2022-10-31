abstract class AuthState {}

class AuthInitial extends AuthState {}

class SignInWithFirebaseLoadingState extends AuthState {}

class SignInWithFirebaseSuccessState extends AuthState {}

class SignInWithFirebaseErrorState extends AuthState {
  final String error;

  SignInWithFirebaseErrorState(this.error);
}

class RegisterWithFireBaseLoadingState extends AuthState {}

class RegisterWithFireBaseSuccessState extends AuthState {}

class RegisterWithFireBaseErrorState extends AuthState {
  final String error;

  RegisterWithFireBaseErrorState(this.error);
}

class CreateUserLoadingState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class CreateUserErrorState extends AuthState {
  final String error;

  CreateUserErrorState(this.error);
}

class GetUserLoadingState extends AuthState {}

class GetUserSuccessState extends AuthState {}

class GetUserErrorState extends AuthState {
  final String error;

  GetUserErrorState(this.error);
}

class UpdateUserLoadingState extends AuthState {}

class UpdateUserSuccessState extends AuthState {}

class UpdateUserErrorState extends AuthState {
  final String error;

  UpdateUserErrorState(this.error);
}