part of 'signin_bloc_bloc.dart';

sealed class SigninBlocEvent extends Equatable {
  const SigninBlocEvent();

  @override
  List<Object> get props => [];

  void add(SignInRequired signInRequired) {}
}

class SignInRequired extends SigninBlocEvent{
	final String email;
	final String password;

	const SignInRequired(this.email, this.password);
}

class SignOutRequired extends SigninBlocEvent{

	const SignOutRequired();
}
