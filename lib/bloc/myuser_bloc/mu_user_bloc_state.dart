part of 'mu_user_bloc_bloc.dart';

sealed class MuUserBlocState extends Equatable {
  const MuUserBlocState();
  
  @override
  List<Object> get props => [];
}

final class MuUserBlocInitial extends MuUserBlocState {}
