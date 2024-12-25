part of '../../core/cores.dart';

class InnerRef extends StatefulWidget {
  const InnerRef({super.key});

  @override
  State<InnerRef> createState() => _InnerRefState();
}

class _InnerRefState extends State<InnerRef> {
  TextEditingController search = TextEditingController();
  final TextEditingController _prestataireController = TextEditingController();
  final TextEditingController _recommendationController =
      TextEditingController();

  // Variables pour gérer l'état de sélection de chaque container
  bool isContainer1Selected = true;
  bool isContainer2Selected = false;
  bool isContainer3Selected = false;

  bool _isSwitched = false;

  String? _motifValue = '';

  // Fonction pour changer l'état du container cliqué
  void toggleSelection(int containerIndex) {
    setState(() {
      if (containerIndex == 1) {
        isContainer1Selected = true;
        isContainer2Selected = false;
        isContainer3Selected = false;

        BlocProvider.of<ReferencementBloc>(context)
            .add(GetReferencementEvent());
      } else if (containerIndex == 2) {
        isContainer2Selected = true;
        isContainer1Selected = false;
        isContainer3Selected = false;

        BlocProvider.of<ReferencementBloc>(context).add(GetReferedRefEvent());
      } else if (containerIndex == 3) {
        isContainer3Selected = true;
        isContainer1Selected = false;
        isContainer2Selected = false;

        BlocProvider.of<ReferencementBloc>(context)
            .add(GetContreReferedEvent());
      }
    });
  }

  Future<void> _onContainerTap(BuildContext myContext) async {
    dynamic result = await showDialog(
      context: myContext,
      builder: (myContext) => AlertDialog(
        title: const Text(
          'Créer un contre referencement',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Palette.primary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Prestataire de soin",
                  ),
                  CustomTextFormInput(
                    labelText: "",
                    hintText: "Entrer le nom du prestataire",
                    controller: _prestataireController,
                    // isPassword: true,
                  ),
                  10.verticalSpace,
                  const Text(
                    "Recommendation",
                  ),
                  CustomTextFormInput(
                    labelText: "",
                    hintText: "Votre Recommendation ici ...",
                    controller: _recommendationController,
                    minLine: 2,
                    // isPassword: true,
                  ),
                  10.verticalSpace,
                  // GestureDetector(
                  //   onTap: () {
                  //     print(_isSwitched);
                  //     setState(() {
                  //       _isSwitched = !_isSwitched;
                  //     });
                  //   },
                  //   child: AnimatedContainer(
                  //     duration: Duration(milliseconds: 300),
                  //     width: 80,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: _isSwitched ? Colors.blue : Colors.grey,
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: AnimatedAlign(
                  //         duration: Duration(milliseconds: 300),
                  //         alignment: _isSwitched
                  //             ? Alignment.centerRight
                  //             : Alignment.centerLeft,
                  //         child: Container(
                  //           width: 32,
                  //           height: 32,
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(16),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text(
              'Annuler',
              style: TextStyle(
                  color: Palette.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              child: const Text(
                'Créer',
                style: TextStyle(
                    color: Palette.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                BlocProvider.of<ContreRefBloc>(context).add(
                    CreateContreRefEvent(
                        prestataire: _prestataireController.text,
                        recommendation: _recommendationController.text,
                        grossesseconfirme: "Oui",
                        idRef: 10));
              }),
        ],
      ),
    );
  }

  Future<void> _onContainerTap2(BuildContext myContext) async {
    dynamic result = await showDialog(
      context: myContext,
      builder: (myContext) => AlertDialog(
        title: const Text(
          'Créer un contre referencement',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Palette.primary),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Chosir un motif",
                  ),
                  DropMenuMotif(onSelected: (String? value) {
                    setState(() {
                      _motifValue = value!;
                      print("Motif sélectionné: $_motifValue");
                    });
                  }),
                  10.verticalSpace,
                  // GestureDetector(
                  //   onTap: () {
                  //     print(_isSwitched);
                  //     setState(() {
                  //       _isSwitched = !_isSwitched;
                  //     });
                  //   },
                  //   child: AnimatedContainer(
                  //     duration: Duration(milliseconds: 300),
                  //     width: 80,
                  //     height: 40,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(20),
                  //       color: _isSwitched ? Colors.blue : Colors.grey,
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(4.0),
                  //       child: AnimatedAlign(
                  //         duration: Duration(milliseconds: 300),
                  //         alignment: _isSwitched
                  //             ? Alignment.centerRight
                  //             : Alignment.centerLeft,
                  //         child: Container(
                  //           width: 32,
                  //           height: 32,
                  //           decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(16),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
        actions: [
          TextButton(
            child: const Text(
              'Annuler',
              style: TextStyle(
                  color: Palette.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              child: const Text(
                'Créer',
                style: TextStyle(
                    color: Palette.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                BlocProvider.of<RefBloc>(context).add(
                    HandleMakeReferencementEvent(id: 3, idMotif: _motifValue!));
              }),
        ],
      ),
    );
  }

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
            Navigator.pop(context);
            showDialogCustom(context, "En cours...");
          } else if (state is MakeReferencementSuccess) {
            Navigator.pop(context);
          } else if (state is MakeReferencementError) {
            _onContainerTap2(context);
            SnackBar snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocListener<ContreRefBloc, ContreRefState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is CreateContreReferencementLoading) {
              Navigator.pop(context);
              showDialogCustom(context, "En cours...");
            } else if (state is CreateContreReferencementSuccess) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      "Le contre referencement a été ajouté avec succés"),
                ),
              );
            } else if (state is CreateContreReferencementError) {
              Navigator.pop(context);
              SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
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
                          : state is CounterReferencementLoading
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
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              "Non Référé",
                                              overflow: TextOverflow.ellipsis,
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
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              "Référé",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Palette.white),
                                            )),
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        GestureDetector(
                                          onTap: () => toggleSelection(3),
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            // width: 100,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              color: isContainer3Selected
                                                  ? Palette.primary
                                                  : const Color.fromARGB(
                                                      255, 112, 179, 233),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: const Center(
                                                child: Text(
                                              "contre Référé",
                                              overflow: TextOverflow.ellipsis,
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
                                                  delegate:
                                                      SliverChildListDelegate(
                                                    state.referencements
                                                        .map((referencement) =>
                                                            ReferencementCard(
                                                              referencement:
                                                                  referencement,
                                                              onDoubleTap: () {
                                                                // Gérer le double-clic ici
                                                                _onContainerTap2(
                                                                    context);
                                                              },
                                                            ))
                                                        .toList(),
                                                  ),
                                                )
                                              : state is ReferedRefGetLoaded
                                                  ? state.referedRefs.isNotEmpty
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
                                                          delegate:
                                                              SliverChildListDelegate(
                                                            state.referedRefs
                                                                .map((referencement) =>
                                                                    ReferencementCard(
                                                                      referencement:
                                                                          referencement,
                                                                    ))
                                                                .toList(),
                                                          ),
                                                        )
                                                      : const SliverAppBar
                                                          .large(
                                                          automaticallyImplyLeading:
                                                              false,
                                                          backgroundColor:
                                                              Palette.white,
                                                          flexibleSpace:
                                                              FlexibleSpaceBar(
                                                            background: Center(
                                                              child: Text(
                                                                'Aucun référencement',
                                                                style: TextStyle(
                                                                    color: Palette
                                                                        .primary,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                  : state
                                                          is CounterReferencementLoaded
                                                      ? state.counterReferencements
                                                              .isNotEmpty
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
                                                              delegate:
                                                                  SliverChildListDelegate(
                                                                state
                                                                    .counterReferencements
                                                                    .map(
                                                                      (referencement) =>
                                                                          ReferencementCard(
                                                                        referencement:
                                                                            referencement,
                                                                        onTap: () =>
                                                                            _onContainerTap(context),
                                                                      ),
                                                                    )
                                                                    .toList(),
                                                              ),
                                                            )
                                                          : const SliverAppBar
                                                              .large(
                                                              automaticallyImplyLeading:
                                                                  false,
                                                              backgroundColor:
                                                                  Palette.white,
                                                              flexibleSpace:
                                                                  FlexibleSpaceBar(
                                                                background:
                                                                    Center(
                                                                  child: Text(
                                                                    'Aucun référencement',
                                                                    style: TextStyle(
                                                                        color: Palette
                                                                            .primary,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                      : const SliverAppBar
                                                          .large(
                                                          backgroundColor:
                                                              Palette.white,
                                                          automaticallyImplyLeading:
                                                              false,
                                                          flexibleSpace:
                                                              FlexibleSpaceBar(
                                                            background: Center(
                                                              child: Text(
                                                                'Une erreur est survenue',
                                                                style: TextStyle(
                                                                    color: Palette
                                                                        .danger,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                ),
              ],
            );
          }),
        ),
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
        BlocProvider(
          create: (context) => ContreRefBloc(),
        ),
      ],
      child: const InnerRef(),
    );
  }
}
