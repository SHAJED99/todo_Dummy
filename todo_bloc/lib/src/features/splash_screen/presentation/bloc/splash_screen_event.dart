import 'package:equatable/equatable.dart';

abstract class SplashScreenEvent extends Equatable {}

class OnInitApp extends SplashScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnSplashDone extends SplashScreenEvent {
  @override
  List<Object?> get props => [];
}
