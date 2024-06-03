part of 'signin_bloc_bloc.dart';

sealed class SigninBlocState extends Equatable {
  const SigninBlocState();
  
  @override
  List<Object> get props => [];
}

final class SigninBlocInitial extends SigninBlocState {}
