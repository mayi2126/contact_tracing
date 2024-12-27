part of '../../core/cores.dart';

class InnerMainSuivi extends StatefulWidget {
  const InnerMainSuivi({super.key});

  @override
  State<InnerMainSuivi> createState() => _InnerMainSuiviState();
}

class _InnerMainSuiviState extends State<InnerMainSuivi> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Palette.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Suivi des femmes enceintes",
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
                      controller: _searchController,
                      hintText: "Recherche ...",
                      labelText: "Recherche...",
                    ),
                  ),
                  5.horizontalSpace,
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Palette.stroke, width: 2),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.sort,
                        color: Palette.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Palette.white,
        ),
        child: const Column(
          children: [
            Text("On danse"),
          ],
        ),
      ),
    );
  }
}

class MainSuivi extends StatelessWidget {
  const MainSuivi({super.key});

  @override
  Widget build(BuildContext context) {
    return const InnerMainSuivi();
  }
}
