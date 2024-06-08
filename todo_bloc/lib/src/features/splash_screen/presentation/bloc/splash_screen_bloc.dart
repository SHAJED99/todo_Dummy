import 'package:bloc/bloc.dart';
import 'package:todo_bloc/components.dart';
import 'package:todo_bloc/src/features/splash_screen/presentation/bloc/splash_screen_event.dart';
import 'package:todo_bloc/src/features/splash_screen/presentation/bloc/splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(const SplashScreenState()) {
    on<OnInitApp>(_onInitApp);
    on<OnSplashDone>(_onSplashDone);
  }

  void _onInitApp(OnInitApp event, Emitter<SplashScreenState> emit) async {
    // TODO: Startup Task
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(isInit: true));
  }

  void _onSplashDone(OnSplashDone event, Emitter<SplashScreenState> emit) async {
    await Future.delayed(defaultSplashScreenShow);
    emit(state.copyWith(isSplashScreenDone: true));
  }
}
