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

  bool _isSwitched = false;

  String? _motifValue = '';
  String? _selectedOption0 = "Non";
  String? _selectedOption1 = "Non";
  String? _selectedOption2 = "Non";
  String? _selectedOption3 = "Non";
  String? _selectedOption4 = "Non";
  String? _selectedOption5 = "Non";
  String? _selectedOption6 = "Non";

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

  // Fonction pour afficher le modal avec les boutons radio
// Fonction pour afficher le modal avec les boutons radio
  void _showBottomDialog(BuildContext myContext) {
    _selectedOption0 = "Non";
    _selectedOption1 = "Non";
    _selectedOption2 = "Non";
    _selectedOption3 = "Non";
    _selectedOption4 = "Non";
    _selectedOption5 = "Non";
    _selectedOption6 = "Non";

    showModalBottomSheet<void>(
      context: myContext,
      scrollControlDisabledMaxHeightRatio: _isSwitched ? 0.5 : 0.8,
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(seconds: 1),
        reverseDuration: const Duration(seconds: 1),
      ),
      builder: (myContext) {
        return StatefulBuilder(
          builder: (myContext, StateSetter setState) {
            return SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: !_isSwitched
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                                "1. Avez-vous accouché il y à moins de 6 mois et allaitez-vous complètement?"),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption0,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption0 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption0,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption0 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            Divider(endIndent: 50, indent: 50),
                            const Text(
                                "2. Et vos règles ont-elles été absentes depuis la naissance de votre enfant?"),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption1,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption1 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption1,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption1 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            Divider(endIndent: 50, indent: 50),
                            const Text(
                                "3. Vous êtes-vous abstenue des rapports sexuels depuis vos dernières règles?"),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption2,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption2 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption2,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption2 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            Divider(endIndent: 50, indent: 50),
                            const Text(
                                "4. Avez-vous accouché dans les sept dernières semaines ?"),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption3,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption3 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption3,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption3 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            Divider(endIndent: 50, indent: 50),
                            const Text(
                                "5. Est-ce que vos règles ont commencées dans les sept dernières semaines sept ?"),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption4,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption4 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption4,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption4 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            Divider(endIndent: 50, indent: 50),
                            const Text(
                                "6. Avez-vous fait une fausse couche ou un avortement dans les sept dernières semaines sept ?"),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption5,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption5 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption5,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption5 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            Divider(endIndent: 50, indent: 50),
                            const Text(
                              "7.  Utilisez-vous une méthode contraceptive fiable de façon correcte et systématique ?",
                            ),
                            5.verticalSpace,
                            Row(
                              children: [
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Oui',
                                  groupValue: _selectedOption6,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption6 = value;
                                    });
                                    if (value == "Oui") {
                                      setState(() {
                                        _isSwitched = true;
                                      });
                                    }
                                  },
                                ),
                                const Text('Oui'),
                                Radio(
                                  activeColor: Palette.primary,
                                  value: 'Non',
                                  groupValue: _selectedOption6,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _selectedOption6 = value;
                                    });
                                  },
                                ),
                                const Text('Non'),
                              ],
                            ),
                            // Si l'état _isSwitched est activé, afficher le menu déroulant
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Créer un contre referencement',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Palette.primary),
                            ),
                            70.verticalSpace,
                            const Text("Choisir un motif"),
                            DropMenuMotif(onSelected: (String? value) {
                              setState(() {
                                _motifValue = value!;
                                print("Motif sélectionné: $_motifValue");
                              });
                            }),
                            10.verticalSpace,
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child: const Text(
                                      'Annuler',
                                      style: TextStyle(
                                          color: Palette.primary,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () {
                                      _isSwitched = false;
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
                                            _isSwitched = false;

                                        BlocProvider.of<RefBloc>(context).add(
                                            HandleMakeReferencementEvent(
                                                id: 3, idMotif: _motifValue!));
                                      }),
                                ])
                          ],
                        ),
                ),
              ),
            );
          },
        );
      },
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
                              color: isContainer1Selected
                                  ? Palette.primary
                                  : const Color.fromARGB(255, 112, 179, 233),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                                child: Text(
                              "Les cibles",
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
                                  : const Color.fromARGB(255, 112, 179, 233),
                              borderRadius: BorderRadius.circular(15),
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
                      ],
                    ),
                    10.verticalSpace,
                    state is ReferencementGetLoading
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
                                : Expanded(
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
                                                      .map(
                                                        (referencement) =>
                                                            ReferencementCard(
                                                                referencement:
                                                                    referencement,
                                                                onTap: () {
                                                                  // Gérer le double-clic ici
                                                                  _showBottomDialog(
                                                                      context);
                                                                },
                                                                onDoubleTap:
                                                                    () {
                                                                  // Gérer le double-clic ici
                                                                  setState(() {
                                                                    _isSwitched =
                                                                        true;
                                                                  });
                                                                  _showBottomDialog(
                                                                      context);
                                                                }),
                                                      )
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
                                  ),
                  ],
                ),
              ),
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
