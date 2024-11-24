part of '../../core/cores.dart';

class CauseriePage extends StatefulWidget {
  const CauseriePage({super.key});

  @override
  State<CauseriePage> createState() => _CauseriePageState();
}

class _CauseriePageState extends State<CauseriePage> {

    TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Causeries Educatives",
          style: TextStyle(color: Palette.white, fontSize: 17),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(
              double.infinity,
              60,
            ),
            child: Container(
              color: Palette.primary,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 2, 15, 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextFormInput(
                          icon: Icons.search,
                          controller: search,
                          hintText: "Recherche ...",
                          labelText: "Recherche..."),
                    ),
                    // const Spacer(),
                    2.horizontalSpace,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.filter_alt_sharp,
                        color: Palette.white,
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addCauserie);
        },
        backgroundColor: Palette.primary,
        child: const Icon(
          Icons.add,
          color: Palette.white,
        ),
        shape: CircleBorder(),
      ),
    );
  }
}