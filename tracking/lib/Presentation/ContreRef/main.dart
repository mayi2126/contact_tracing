part of '../../core/cores.dart';

class InnerContreRef extends StatefulWidget {
  const InnerContreRef({super.key});

  @override
  State<InnerContreRef> createState() => _InnerContreRefState();
}

class _InnerContreRefState extends State<InnerContreRef> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _prestataireController = TextEditingController();
  final TextEditingController _recommendationController =
      TextEditingController();

  List<Referencement> _filteredReferencements = [];
  List<Referencement> _filteredReferencementsAll = [];

  bool isContainer3Selected = true;
  bool isContainer4Selected = false;
// Fonction pour changer l'état du container cliqué
  void toggleSelection(int containerIndex) {
    setState(() {
      if (containerIndex == 1) {
        isContainer3Selected = true;
        isContainer4Selected = false;

        BlocProvider.of<ListBloc>(context).add(GetContreReferedEvent());
      } else if (containerIndex == 2) {
        isContainer3Selected = false;
        isContainer4Selected = true;

        BlocProvider.of<ListBloc>(context).add(GetContreReferedEventByDate());
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

  @override
  void dispose() {
    _prestataireController.dispose();
    _recommendationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterReferencements);
  }

  void _filterReferencements() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredReferencements = _filteredReferencementsAll;
      }
      // Filtrer les `contreReferencements` en fonction de la recherche
      _filteredReferencements = _filteredReferencementsAll
          .where((referencement) =>
              referencement.fullName!.toLowerCase().contains(query))
          .toList();
    });
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
          "Contre Referencements",
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
      body: BlocListener<ContreRefBloc, ContreRefState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is CreateContreReferencementLoading) {
            Navigator.pop(context);
            showDialogCustom(context, "En cours...");
          } else if (state is CreateContreReferencementSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text("Le contre referencement a été ajouté avec succés"),
              ),
            );
          } else if (state is CreateContreReferencementError) {
            Navigator.pop(context);
            SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocListener<ListBloc, ListState>(
          listener: (context, state) {
            if (state is ContreReferencementLoaded) {
              _filteredReferencements = state.contreReferencements;
              _filteredReferencementsAll = state.contreReferencements;
            }
            if (state is CounterReferencementLoaded) {
              _filteredReferencements = state.counterReferencements;
              _filteredReferencementsAll = state.counterReferencements;
            }
          },
          child: BlocBuilder<ListBloc, ListState>(
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
                    child: Column(
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
                                  color: isContainer3Selected
                                      ? Palette.primary
                                      : const Color.fromARGB(
                                          255, 112, 179, 233),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Tous/All",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palette.white),
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
                                  color: isContainer4Selected
                                      ? Palette.primary
                                      : const Color.fromARGB(
                                          255, 112, 179, 233),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                    child: Text(
                                  "Contre référé",
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
                        state is CounterReferencementLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : state is ContreReferencementLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Expanded(
                                    child: CustomScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      slivers: <Widget>[
                                        state is CounterReferencementLoaded
                                            ? _filteredReferencements.isNotEmpty
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
                                                      _filteredReferencements
                                                          .map(
                                                            (referencement) =>
                                                                ReferencementCard(
                                                              referencement:
                                                                  referencement,
                                                              onTap: () =>
                                                                  _onContainerTap(
                                                                      context),
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  )
                                                : const SliverAppBar.large(
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
                                            : state is ContreReferencementLoaded
                                                ? _filteredReferencements
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
                                                          _filteredReferencements
                                                              .map(
                                                                (referencement) =>
                                                                    ReferencementCard(
                                                                  referencement:
                                                                      referencement,
                                                                  onTap: () {},
                                                                ),
                                                              )
                                                              .toList(),
                                                        ),
                                                      )
                                                    : const SliverAppBar.large(
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
                                                : const SliverAppBar.large(
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
                                  )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class MainContreRef extends StatelessWidget {
  const MainContreRef({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContreRefBloc(),
        ),
        BlocProvider(
          create: (context) => ListBloc()..add(GetContreReferedEvent()),
        ),
      ],
      child: const InnerContreRef(),
    );
  }
}
