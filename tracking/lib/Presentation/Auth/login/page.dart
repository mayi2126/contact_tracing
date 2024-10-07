part of '../../../core/cores.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppConfig.init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Palette.primary,
                    child:  Icon(Icons.person),
                  ),
                  35.verticalSpaceFromWidth,
                  const Text(
                    "Connexion",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Palette.primary),
                  ),
              
                  30.verticalSpace,
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextFormInput(
                          labelText: "Email",
                          hintText: "exemple@gmail.com",
                          controller: _phoneController,
                          isPassword: true,
                        ),
                        16.verticalSpaceFromWidth,
                        CustomTextFormInput(
                          labelText: "Mot de passe",
                          hintText: "*****",
                          controller: _passwordController,
                          isPassword: true,
                        ),
                        25.verticalSpaceFromWidth,
                        PrimarytButton(
                          btnText: "Se connecter",
                          isFilledBtn: true,
                          onTapFuncton: () {
                            Navigator.pushNamed(context, RoutesName.main);
                          },
                          height: 50,
                          size: 22,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Vous n'avez pas de compte ?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RoutesName.registration);
                              },
                              style: ButtonStyle(
                                foregroundColor: WidgetStateProperty.all<Color>(Palette.primary),
                              ),
                              child: const Text("S'inscrire"),
                            ),
                          ],),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
