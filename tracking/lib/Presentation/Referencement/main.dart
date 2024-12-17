part of '../../core/cores.dart';

class MainReferencement extends StatefulWidget {
  const MainReferencement({super.key});

  @override
  State<MainReferencement> createState() => _MainReferencementState();
}

class _MainReferencementState extends State<MainReferencement> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Recensements",
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
                    5.horizontalSpace,
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        // color: Palette.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Palette.stroke, width: 2),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.filter_alt_sharp,
                          color: Palette.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Container(
                  height: 700,
                  padding: const EdgeInsets.all(8),
                  color: Colors.green[100],
                  child: Container(
                    height: 100,
                    color: Colors.green[200],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
