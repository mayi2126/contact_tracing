part of '../../core/cores.dart';

class InnerRef extends StatefulWidget {
  const InnerRef({super.key});

  @override
  State<InnerRef> createState() => _InnerRefState();
}

class _InnerRefState extends State<InnerRef> {
  TextEditingController search = TextEditingController();

  // Variables pour gérer l'état de sélection de chaque container
  bool isContainer1Selected = true;
  bool isContainer2Selected = false;

  // Fonction pour changer l'état du container cliqué
  void toggleSelection(int containerIndex) {
    setState(() {
      if (containerIndex == 1) {
        isContainer1Selected = true;
        isContainer2Selected = false;

        BlocProvider.of<ReferencementBloc>(context)
            .add(GetReferencementEvent());
      } else if (containerIndex == 2) {
        isContainer2Selected = true;
        isContainer1Selected = false;

        BlocProvider.of<ReferencementBloc>(context).add(GetReferedRefEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primary,
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Referencements",
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
                        Icons.filter_alt_sharp,
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
      body: BlocListener<RefBloc, RefState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is MakeReferencementLoading) {
            showDialogCustom(context, "En cours...");
          } else if (state is MakeReferencementSuccess) {
            Navigator.pop(context);
          } else if (state is MakeReferencementError) {
            SnackBar snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<ReferencementBloc, ReferencementState>(
            builder: (context, state) {
          return Stack(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Palette.white,
                  ),
                  child: state is ReferencementGetLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : state is ReferedRefGetLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () => toggleSelection(1),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: isContainer1Selected
                                              ? Palette.primary
                                              : const Color.fromARGB(
                                                  255, 112, 179, 233),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "Non Référé",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Palette.white,
                                          ),
                                        )),
                                      ),
                                    ),
                                    10.horizontalSpace,
                                    GestureDetector(
                                      onTap: () => toggleSelection(2),
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: isContainer2Selected
                                              ? Palette.primary
                                              : const Color.fromARGB(
                                                  255, 112, 179, 233),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          "Référé",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Palette.white),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                                10.verticalSpace,
                                Expanded(
                                  child: CustomScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    slivers: <Widget>[
                                      state is ReferencementGetLoaded
                                          ? SliverGrid(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    2, // Deux éléments par ligne
                                                crossAxisSpacing:
                                                    5, // Espacement horizontal entre les éléments
                                                mainAxisSpacing:
                                                    2, // Espacement vertical entre les éléments
                                                // Définir un ratio d'aspect qui donne la hauteur désirée
                                                childAspectRatio:
                                                    1, // La largeur est 2x la hauteur
                                              ),
                                              delegate: SliverChildListDelegate(
                                                state.referencements
                                                    .map((referencement) =>
                                                        ReferencementCard(
                                                          referencement:
                                                              referencement,
                                                          onDoubleTap: () {
                                                            // Gérer le double-clic ici
                                                            BlocProvider.of<
                                                                        RefBloc>(
                                                                    context)
                                                                .add(
                                                                    HandleMakeReferencementEvent(
                                                                        id: 3));
                                                          },
                                                        ))
                                                    .toList(),
                                              ),
                                            )
                                          
                                          :state is ReferedRefGetLoaded
                                          ? SliverGrid(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    2, // Deux éléments par ligne
                                                crossAxisSpacing:
                                                    5, // Espacement horizontal entre les éléments
                                                mainAxisSpacing:
                                                    2, // Espacement vertical entre les éléments
                                                // Définir un ratio d'aspect qui donne la hauteur désirée
                                                childAspectRatio:
                                                    1, // La largeur est 2x la hauteur
                                              ),
                                              delegate: SliverChildListDelegate(
                                                state.referedRefs
                                                    .map((referencement) =>
                                                        ReferencementCard(
                                                          referencement:
                                                              referencement,
                                                          onDoubleTap: () {
                                                            // Gérer le double-clic ici
                                                            BlocProvider.of<
                                                                        RefBloc>(
                                                                    context)
                                                                .add(
                                                                    HandleMakeReferencementEvent(
                                                                        id: 3));
                                                          },
                                                        ))
                                                    .toList(),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            )),
            ],
          );
        }),
      ),
    );
  }
}

class MainReferencement extends StatelessWidget {
  const MainReferencement({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ReferencementBloc()..add(GetReferencementEvent()),
        ),
        BlocProvider(
          create: (context) => RefBloc(),
        ),
      ],
      child: const InnerRef(),
    );
  }
}
