part of '../../../core/cores.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginPageBody();
  }
}

class _LoginPageBody extends StatefulWidget {
  const _LoginPageBody({super.key});

  @override
  State<_LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<_LoginPageBody> {
  final _emailController = TextEditingController(text: 'ascagbandi@gmail.com');
  final _passwordController = TextEditingController(text: '12345678');
  final _formKey = GlobalKey<FormState>();
  var desabledButton = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginLoaded) {
            Navigator.pushReplacementNamed(context, RoutesName.main);
          }

          if (state is LoginLoading) {
            desabledButton = true;
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 25),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: SvgPicture.asset("assets/svg/access1.svg",fit: BoxFit.fill,),
                      ),
                      const SizedBox(height: 35),
                      const Text(
                        "Connexion",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.primary,
                        ),
                      ),
                      30.verticalSpace,
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormInput(
                              labelText: "Email",
                              hintText: "exemple@gmail.com",
                              controller: _emailController,
                              isPassword: false, // Change to false for email
                            ),
                            const SizedBox(height: 16),
                            CustomTextFormInput(
                              labelText: "Mot de passe",
                              hintText: "*****",
                              controller: _passwordController,
                              isPassword: true,
                            ),
                            25.verticalSpace,
                            PrimaryButton(
                              textColor: Palette.white,
                              btnText: state is LoginLoading
                                  ? state.msg
                                  : "Se connecter",
                              isFilledBtn: true,
                              onTapFunction: state is LoginLoading
                                  ? () {}
                                  : () {
                                      //TODOS: Validation des champs
                                      if (true) {
                                        // BlocProvider.of<LoginBloc>(context).add(
                                        //   LoginDataSending(
                                        //     _emailController.text,
                                        //     _passwordController.text,
                                        //   ),
                                        // );

                                        context.read<LoginBloc>().add(
                                              LoginDataSending(
                                                _emailController.text,
                                                _passwordController.text,
                                              ),
                                            );

                                        // Optionnel : gérer la navigation après une connexion réussie
                                      }
                                    },
                              height: 50,
                              size: 22,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
