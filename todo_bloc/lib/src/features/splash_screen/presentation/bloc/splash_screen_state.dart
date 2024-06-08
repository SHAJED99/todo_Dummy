import 'package:equatable/equatable.dart';

class SplashScreenState extends Equatable {
  final bool isSplashScreenDone;
  final bool isInit;
  const SplashScreenState({
    this.isSplashScreenDone = false,
    this.isInit = false,
  });

  @override
  List<Object> get props => [
        isSplashScreenDone,
        isInit
      ];

  SplashScreenState copyWith({
    bool? isSplashScreenDone,
    bool? isInit,
  }) {
    return SplashScreenState(
      isSplashScreenDone: isSplashScreenDone ?? this.isSplashScreenDone,
      isInit: isInit ?? this.isInit,
    );
  }
}
