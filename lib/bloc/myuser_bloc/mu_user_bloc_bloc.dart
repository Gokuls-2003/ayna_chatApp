import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'mu_user_bloc_event.dart';
part 'mu_user_bloc_state.dart';

class MuUserBlocBloc extends Bloc<MuUserBlocEvent, MuUserBlocState> {
  MuUserBlocBloc() : super(MuUserBlocInitial()) {
    on<MuUserBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
