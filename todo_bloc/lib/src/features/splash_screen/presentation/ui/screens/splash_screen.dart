import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/components.dart';
import 'package:todo_bloc/src/core/presentation/widgets/text.dart';
import 'package:todo_bloc/src/features/authentication/presentation/login/ui/screens/login_screen.dart';
import 'package:todo_bloc/src/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:todo_bloc/src/features/splash_screen/presentation/bloc/splash_screen_event.dart';
import 'package:todo_bloc/src/features/splash_screen/presentation/bloc/splash_screen_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bloc = SplashScreenBloc();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.add(OnInitApp());
      bloc.add(OnSplashDone());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => bloc,
          child: BlocListener<SplashScreenBloc, SplashScreenState>(
            listener: (context, state) {
              if (!state.isInit || !state.isSplashScreenDone) return;

              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            child: const Stack(
              children: [
                Center(child: CustomTextHeading.L(text: "Bloc - Clean", isBold: true)),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: _BottomText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomText extends StatelessWidget {
  const _BottomText();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenBloc, SplashScreenState>(
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(defaultPadding / 2),
          child: CustomTextTitle.S(text: state.isInit ? "Initialized App" : "Initializing App"),
        );
      },
    );
  }
}
