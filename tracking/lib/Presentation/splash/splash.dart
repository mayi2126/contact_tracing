part of '../../core/cores.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Navigator.pushReplacementNamed(context, RoutesName.main);
        } else {
          Navigator.pushReplacementNamed(context, RoutesName.login);
        }
      },
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
