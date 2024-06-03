part of 'signin_bloc_bloc.dart';

sealed class SigninBlocState extends Equatable {
  const SigninBlocState();
  
  @override
  List<Object> get props => [];
}

final class SigninBlocInitial extends SigninBlocState {}

class SignInSuccess extends SigninBlocState {}
class SignInFailure extends SigninBlocState {
	final String? message;

	const SignInFailure({this.message});
}
class SignInProcess extends SigninBlocState {}