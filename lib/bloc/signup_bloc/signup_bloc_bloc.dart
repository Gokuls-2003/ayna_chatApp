import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repo.dart';
import 'package:user_repository/user_repository.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBlocBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  final UserRepository _userRepository;

  SignupBlocBloc({
    required UserRepository userRepository
  }) :  _userRepository = userRepository,
  super(SignupBlocInitial()) {
    on<SignUpRequired>((event, emit) async{
      	try {
        MyUser user = await _userRepository.signUp(event.user, event.password);
				await _userRepository.setUserData(user);
				emit(SignUpSuccess());
      } catch (e) {
				emit(SignUpFailure());
      }
    });
  }
}
