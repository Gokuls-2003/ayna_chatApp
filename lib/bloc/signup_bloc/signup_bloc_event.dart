part of 'signup_bloc_bloc.dart';

sealed class SignupBlocEvent extends Equatable {
  const SignupBlocEvent();

  @override
  List<Object> get props => [];
}

class SignUpRequired extends SignupBlocEvent{
	final MyUser user;
	final String password;

	const SignUpRequired(this.user, this.password);
}