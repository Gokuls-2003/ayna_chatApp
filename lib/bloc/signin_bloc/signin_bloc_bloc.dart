import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repo.dart';

part 'signin_bloc_event.dart';
part 'signin_bloc_state.dart';

class SigninBlocBloc extends Bloc<SigninBlocEvent, SigninBlocState> {
  final UserRepository _userRepository;
  SigninBlocBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SigninBlocInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } on FirebaseAuthException catch (e) {
        emit(SignInFailure(message: e.code));
      } catch (e) {
        emit(const SignInFailure());
      }
    });
    on<SignOutRequired>((event, emit) async {
      await _userRepository.logOut();
    });
  }
}
