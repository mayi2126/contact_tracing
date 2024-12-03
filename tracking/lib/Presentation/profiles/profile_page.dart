part of '../../core/cores.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      20.verticalSpace,
      CircleAvatar(
        radius: 60,
        backgroundImage: Image.asset("assets/jpg/pp.jpg").image,
      ),
      15.verticalSpace,
      const Text(
        "ASC AGBANDI",
        style: TextStyle(
            color: Palette.primary, fontWeight: FontWeight.w600, fontSize: 18),
      ),
      const Spacer(),
      ListTile(
        leading: const Icon(Icons.logout_outlined),
        title: const Text("Se deconnecter"),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text(
                  "En cours de deconnexion ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                content: SizedBox(
                  height: 100, // Adjust the height here
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Palette
                          .primary, // Replace with a valid color reference
                      strokeWidth: 3,
                    ),
                  ),
                ),
              );
            },
          );

          Future.delayed(const Duration(seconds: 3), () {
            context.read<LoginBloc>().add(AuthLogout());
            Navigator.of(context).pushReplacementNamed(RoutesName.splash);
          });
        },
      )
    ]);
  }
}
