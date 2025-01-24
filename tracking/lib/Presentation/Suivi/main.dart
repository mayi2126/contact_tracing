part of '../../core/cores.dart';

class InnerMainSuivi extends StatefulWidget {
  const InnerMainSuivi({super.key});

  @override
  State<InnerMainSuivi> createState() => _InnerMainSuiviState();
}

enum SampleItem { addSuivi }

class _InnerMainSuiviState extends State<InnerMainSuivi> {
  final TextEditingController _searchController = TextEditingController();
  List<Referencement> _filtedPatients = [];
  List<Referencement> _filtedPatientsAll = [];
  List<PatientSuivi> _filtedPatientsSuivis = [];
  List<PatientSuivi> _filtedPatientsSuivisAll = [];

  SampleItem? selectedItem;

  String? _respecte = "Oui";
  String? _cpnavantdouzsa = "Non";
  String? _dispomedicament = "Non";
  String? _palumiidisponible = "Non";
  String? _paludormirsousmii = "Non";
  String? _palutpiun = "Non";
  String? _palutpideux = "Non";
  String? _palutpitrois = "Non";
  String? _palutpiquatre = "Non";
  String? _statuvaccorrect = "Non";
  String? _analysemedrealise = "Non";
  String? _recherchesignedanger = "";
  String? _lieuaccouchementfs = "Non";
  String? _issusaccouchement = "";
  final String? _sirdvrespectenon = "";

  final List<String> dangers = ["Fièvre (Corps chaud)", "Maux de tête"];
  final List<String> accouchements = [
    "Accouchement",
    "Avortement spontané",
    "Autres à preciser"
  ];
  final List<String> rdvs = [
    "Pas disponible",
    "Intempérie",
    "Absence de moyen de déplacement",
    "Refus du conjoint",
    "Autres à preciser"
  ];
  bool isTargetsSelected = true;
  bool isPatientsSuiviSelected = false;

  void _filterPatients() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filtedPatients = _filtedPatientsAll;
      }
      // Filtrer les `contreReferencements` en fonction de la recherche
      _filtedPatients = _filtedPatientsAll
          .where((patient) =>
              patient.fullName!.toLowerCase().contains(query) ||
              patient.prestatairesoins!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchController.removeListener(_filterPatients);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterPatients);
  }

  void _showBottomDialog(BuildContext myContext, int? id) {
    showModalBottomSheet<void>(
      context: myContext,
      scrollControlDisabledMaxHeightRatio: 0.8,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        " Rendez-vous respecté ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _respecte,
                            onChanged: (String? value) {
                              setState(() {
                                _respecte = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _respecte,
                            onChanged: (String? value) {
                              setState(() {
                                _respecte = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      3.verticalSpace,
                      _respecte == "Non"
                          ? DropdownMenu<String>(
                              inputDecorationTheme: InputDecorationTheme(
                                filled: true,
                                fillColor: Palette.bgGrey,
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Palette.primary,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Palette.stroke,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // initialSelection: themes.isNotEmpty
                              //     ? (themes.firstWhere((theme) => theme['id'] == id,
                              //             orElse: () => themes.first))['id']
                              //         .toString()
                              //     : null,
                              width: getWidth(333),

                              trailingIcon:
                                  const Icon(Icons.keyboard_arrow_down_sharp),
                              selectedTrailingIcon:
                                  const Icon(Icons.keyboard_arrow_up_sharp),
                              initialSelection: rdvs.first,
                              onSelected: (value) {
                                _recherchesignedanger = value;
                              },
                              // Appel du callback avec l'id sélectionné
                              dropdownMenuEntries: rdvs
                                  .map<DropdownMenuEntry<String>>((String rdv) {
                                return DropdownMenuEntry<String>(
                                  value: rdv, // Utilisez l'id comme valeur
                                  label: rdv, // Affichez le name comme label
                                );
                              }).toList(),
                            )
                          : const SizedBox(),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " CPN effectuées avant 12 SA ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _cpnavantdouzsa,
                            onChanged: (String? value) {
                              setState(() {
                                _cpnavantdouzsa = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _cpnavantdouzsa,
                            onChanged: (String? value) {
                              setState(() {
                                _cpnavantdouzsa = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " Dispose t’elle des médicaments prescrits ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _dispomedicament,
                            onChanged: (String? value) {
                              setState(() {
                                _dispomedicament = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _dispomedicament,
                            onChanged: (String? value) {
                              setState(() {
                                _dispomedicament = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " MII disponible ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _palumiidisponible,
                            onChanged: (String? value) {
                              setState(() {
                                _palumiidisponible = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _palumiidisponible,
                            onChanged: (String? value) {
                              setState(() {
                                _palumiidisponible = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      3.verticalSpace,
                      const Text(
                        " Dormir sous MII ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _paludormirsousmii,
                            onChanged: (String? value) {
                              setState(() {
                                _paludormirsousmii = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _paludormirsousmii,
                            onChanged: (String? value) {
                              setState(() {
                                _paludormirsousmii = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      3.verticalSpace,
                      const Text(
                        " TPI 1 disponible ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _palutpiun,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpiun = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _palutpiun,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpiun = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      3.verticalSpace,
                      const Text(
                        " TPI 2 disponible ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _palutpideux,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpideux = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _palutpideux,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpideux = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      3.verticalSpace,
                      const Text(
                        " TPI 3 disponible ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _palutpitrois,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpitrois = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _palutpitrois,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpitrois = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      3.verticalSpace,
                      const Text(
                        " TPI 4 disponible ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _palutpiquatre,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpiquatre = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _palutpiquatre,
                            onChanged: (String? value) {
                              setState(() {
                                _palutpiquatre = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        "Statut vaccinal correct ?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _statuvaccorrect,
                            onChanged: (String? value) {
                              setState(() {
                                _statuvaccorrect = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _statuvaccorrect,
                            onChanged: (String? value) {
                              setState(() {
                                _statuvaccorrect = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " Analyse médicales réalisées",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _analysemedrealise,
                            onChanged: (String? value) {
                              setState(() {
                                _analysemedrealise = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _analysemedrealise,
                            onChanged: (String? value) {
                              setState(() {
                                _analysemedrealise = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " Rechercher les signes de danger chez la FE",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      DropdownMenu<String>(
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: Palette.bgGrey,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Palette.primary,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.stroke,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        initialSelection: dangers.first,
                        // initialSelection: themes.isNotEmpty
                        //     ? (themes.firstWhere((theme) => theme['id'] == id,
                        //             orElse: () => themes.first))['id']
                        //         .toString()
                        //     : null,
                        width: getWidth(333),

                        trailingIcon:
                            const Icon(Icons.keyboard_arrow_down_sharp),
                        selectedTrailingIcon:
                            const Icon(Icons.keyboard_arrow_up_sharp),
                        // initialSelection: list.first,
                        onSelected: (value) {
                          _recherchesignedanger = value;
                        },
                        // Appel du callback avec l'id sélectionné
                        dropdownMenuEntries: dangers
                            .map<DropdownMenuEntry<String>>((String danger) {
                          return DropdownMenuEntry<String>(
                            value: danger, // Utilisez l'id comme valeur
                            label: danger, // Affichez le name comme label
                          );
                        }).toList(),
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " Accouchement à la FS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      Row(
                        children: [
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Oui',
                            groupValue: _lieuaccouchementfs,
                            onChanged: (String? value) {
                              setState(() {
                                _lieuaccouchementfs = value;
                              });
                            },
                          ),
                          const Text('Oui'),
                          Radio(
                            activeColor: Palette.primary,
                            value: 'Non',
                            groupValue: _lieuaccouchementfs,
                            onChanged: (String? value) {
                              setState(() {
                                _lieuaccouchementfs = value;
                              });
                            },
                          ),
                          const Text('Non'),
                        ],
                      ),
                      const Divider(endIndent: 50, indent: 50),
                      3.verticalSpace,
                      const Text(
                        " Issus de la grossesse",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      5.verticalSpace,
                      DropdownMenu<String>(
                        inputDecorationTheme: InputDecorationTheme(
                          filled: true,
                          fillColor: Palette.bgGrey,
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              color: Palette.primary,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.stroke,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        initialSelection: accouchements.first,
                        // initialSelection: themes.isNotEmpty
                        //     ? (themes.firstWhere((theme) => theme['id'] == id,
                        //             orElse: () => themes.first))['id']
                        //         .toString()
                        //     : null,
                        width: getWidth(333),

                        trailingIcon:
                            const Icon(Icons.keyboard_arrow_down_sharp),
                        selectedTrailingIcon:
                            const Icon(Icons.keyboard_arrow_up_sharp),
                        // initialSelection: list.first,
                        onSelected: (value) {
                          _issusaccouchement = value;
                        },
                        // Appel du callback avec l'id sélectionné
                        dropdownMenuEntries: accouchements
                            .map<DropdownMenuEntry<String>>((String accou) {
                          return DropdownMenuEntry<String>(
                            value: accou, // Utilisez l'id comme valeur
                            label: accou, // Affichez le name comme label
                          );
                        }).toList(),
                      ),
                      10.verticalSpace,
                      PrimaryButton(
                        btnText: "Enregistrer",
                        width: double.infinity,
                        textColor: Palette.white,
                        isFilledBtn: true,
                        onTapFunction: () {
                          Suivi suivi = Suivi(
                              idRef: id,
                              rdvrespecte: _respecte!,
                              cpnavantdouzsa: _cpnavantdouzsa!,
                              dispomedicament: _dispomedicament!,
                              palumiidisponible: _palumiidisponible!,
                              paludormirsousmii: _paludormirsousmii!,
                              palutpiun: _palutpiun!,
                              palutpideux: _palutpideux!,
                              palutpitrois: _palutpitrois!,
                              palutpiquatre: _palutpiquatre!,
                              statuvaccorrect: _statuvaccorrect!,
                              analysemedrealise: _analysemedrealise!,
                              recherchesignedanger: _recherchesignedanger!,
                              grossesseconfirme: "Oui",
                              agegrossesse: "20 S",
                              lieuaccouchementfs: _lieuaccouchementfs!,
                              issusaccouchement: _issusaccouchement!,
                              sirdvrespectenon: _sirdvrespectenon!);

                          BlocProvider.of<ManageBloc>(context)
                              .add(AddingSuiviEvent(suivi));
                        },
                        btnBgColor: Palette.primary,
                      ),
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

  void toggleSelection(int index) {
    if (index == 1) {
      isTargetsSelected = true;
      isPatientsSuiviSelected = false;
      BlocProvider.of<SuiviBloc>(context).add(GetPatientsEvent());
    } else if (index == 2) {
      isTargetsSelected = false;
      isPatientsSuiviSelected = true;
      BlocProvider.of<SuiviBloc>(context).add(GetPatientSuiviEvent());
    }
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<SuiviBloc, SuiviState>(
            listener: (context, state) {
              if (state is GetPatientsSuccess) {
                _filtedPatients = state.patients;
                _filtedPatientsAll = state.patients;
              } else if (state is GetPatientsSuiviSuccess) {
                _filtedPatientsSuivis = state.patients;
                _filtedPatientsSuivisAll = state.patients;
              } else if (state is GetPatientsSuiviLoading) {}
            },
          ),
          BlocListener<ManageBloc, ManageState>(
            listener: (context, state) {
              if (state is AddingLoading) {
                Navigator.pop(context);
                showDialogCustom(context, "En cours ...");
              } else if (state is AddSuiviSuccessed) {
                Navigator.pop(context);
                PanaraInfoDialog.showAnimatedGrow(
                  context,
                  // title: "Hello",
                  buttonTextColor: Palette.white,
                  color: Palette.white,
                  message: "Le suivi a été enregistré.",
                  buttonText: "OK",
                  onTapDismiss: () => Navigator.pop(context),
                  panaraDialogType: PanaraDialogType.normal,
                );
              }
            },
          )
        ],
        child: BlocBuilder<SuiviBloc, SuiviState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(15),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Palette.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: isTargetsSelected
                                ? Palette.primary
                                : const Color.fromARGB(255, 112, 179, 233),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                              child: Text(
                            "Tous",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.white),
                          )),
                        ),
                      ),
                      5.horizontalSpace,
                      GestureDetector(
                        onTap: () => toggleSelection(2),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          // width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: isPatientsSuiviSelected
                                ? Palette.primary
                                : const Color.fromARGB(255, 112, 179, 233),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                              child: Text(
                            "Liste de suivi",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Palette.white),
                          )),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Scrollbar(
                    thumbVisibility: true,
                    interactive: true,
                    radius: const Radius.circular(10),
                    child: CustomScrollView(
                      scrollBehavior: const MaterialScrollBehavior(),
                      slivers: state is GetPatientsSuiviSuccess
                          ? _filtedPatientsSuivis
                              .map((patient) => CardPatientSuivi(
                                    patient: patient,
                                    onPressed: () {
                                      _showBottomDialog(context, 10);
                                    },
                                  ))
                              .toList()
                          : state is GetPatientsSuccess
                              ? _filtedPatients
                                  .map((patient) => CardSuivi(
                                        patient: patient,
                                        onPressed: () {
                                          _showBottomDialog(
                                              context, patient.id);
                                        },
                                      ))
                                  .toList()
                              : state is GetPatientsLoading
                                  ? [
                                      const SliverAppBar.large(
                                        automaticallyImplyLeading: false,
                                        backgroundColor: Palette.white,
                                        flexibleSpace: FlexibleSpaceBar(
                                          background: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        ),
                                      )
                                    ]
                                  : state is GetPatientsSuiviLoading
                                      ? [
                                          const SliverAppBar.large(
                                            automaticallyImplyLeading: false,
                                            backgroundColor: Palette.white,
                                            flexibleSpace: FlexibleSpaceBar(
                                              background: Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                            ),
                                          )
                                        ]
                                      : [
                                          const SliverAppBar.large(
                                            automaticallyImplyLeading: false,
                                            backgroundColor: Palette.white,
                                            flexibleSpace: FlexibleSpaceBar(
                                              background:
                                                  Center(child: Text("Erreur")),
                                            ),
                                          )
                                        ],
                      // [
                      //   SliverAnimatedList(
                      //     itemBuilder: (context, index, animation)

                      // [
                      //   SliverAnimatedList(
                      //     itemBuilder: (context, index, animation) {
                      //       return SlideTransition(
                      //         position: Tween<Offset>(
                      //           begin: const Offset(0, 1),
                      //           end: Offset.zero,
                      //         ).animate(animation),
                      //         child: Container(
                      //           margin: const EdgeInsets.only(bottom: 15),
                      //           padding: const EdgeInsets.all(15),
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Palette.stroke,
                      //           ),
                      //           child: const Text("df"),
                      //         ),
                      //       );
                      //     },
                      //   ),

                      //   _filtedPatients.map(toElement => SliverToBoxAdapter()).toList(),
                      // ],
                    ),
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardPatientSuivi extends StatelessWidget {
  const CardPatientSuivi({super.key, required this.patient, required this.onPressed});
  final PatientSuivi patient;
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: ()=> Navigator.pushNamed(context, RoutesName.suiviDetails,arguments: patient),
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Palette.bgGrey,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    patient.fullName,
                    style: const TextStyle(fontSize: 20),
                  ),
                  8.horizontalSpace,
                  const Text("|"),
                  8.horizontalSpace,
                  Text(
                    patient.statutref,
                    style: const TextStyle(fontSize: 16, color: Palette.textSuccess),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.edit_rounded,
                      color: Palette.primary,
                    ),
                    onPressed: 
                      onPressed
                    ,
                  )
                ],
              ),
              const Divider(
                indent: 30,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Palette.bgGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      "Rendez-vous respecté",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    patient.rdvrespecte == "Oui"
                        ? const Icon(
                            Icons.check_outlined,
                            color: Palette.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.close_outlined,
                            color: Palette.danger,
                            size: 20,
                          ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Palette.bgGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      "Medicament diponible",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    patient.dispomedicament == "Oui"
                        ? const Icon(
                            Icons.check_outlined,
                            color: Palette.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.close_outlined,
                            color: Palette.danger,
                            size: 20,
                          ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Palette.bgGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      "Mi disponible",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    patient.palumiidisponible == "Oui"
                        ? const Icon(
                            Icons.check_outlined,
                            color: Palette.primary,
                            size: 20,
                          )
                        : const Icon(
                            Icons.close_outlined,
                            color: Palette.danger,
                            size: 20,
                          ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    // color: Palette.bgGrey,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Text(
                      "Issue d'accouchement",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      patient.issusaccouchement,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 13, color: Palette.warningText),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardSuivi extends StatelessWidget {
  const CardSuivi({
    super.key,
    required this.patient,
    this.onPressed,
  });
  final Referencement patient;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    SampleItem? selectedItem;

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Palette.bgGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.horizontalSpace,
                Text(
                  " ${patient.prestatairesoins}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                8.horizontalSpace,
                const Text("|"),
                8.horizontalSpace,
                Text(
                  "${patient.fullName}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Palette.textSuccess),
                ),
                const Spacer(),
                patient.grossesseconfirme == null
                    ? const SizedBox()
                    : patient.grossesseconfirme == "Oui"
                        ? const Icon(
                            Icons.check_circle_outline_outlined,
                            color: Palette.textSuccess,
                          )
                        : const SizedBox(),
                15.horizontalSpace,
              ],
            ),
            5.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                dateStringFormat(patient.dateprochainrdv),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Palette.danger),
              ),
            ),
            10.verticalSpace,
            const Text("Recommandation",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Palette.foreign)),
            3.verticalSpace,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // color: Palette.bgGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Palette.primary,
                    size: 20,
                  ),
                  5.horizontalSpace,
                  Text(
                    "${patient.recommandation}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            2.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Village",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Palette.foreign)),
                    3.verticalSpace,
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          // color: Palette.bgGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_downward_outlined,
                            color: Palette.primary,
                            size: 20,
                          ),
                          5.horizontalSpace,
                          Text(
                            "${patient.nomvillage}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                28.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Quartier",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Palette.foreign)),
                    3.verticalSpace,
                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          // color: Palette.bgGrey,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_upward_outlined,
                            color: Palette.textSuccess,
                            size: 20,
                          ),
                          5.horizontalSpace,
                          SizedBox(
                            width: 50,
                            child: Text(
                              "${patient.nomquartier}",
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                PopupMenuButton<SampleItem>(
                  initialValue: selectedItem,
                  onSelected: (SampleItem item) {},
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SampleItem>>[
                    PopupMenuItem<SampleItem>(
                      onTap: onPressed,
                      value: SampleItem.addSuivi,
                      child: const Text('Créer un suivi'),
                    ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemTwo,
                    //   child: Text('Item 2'),
                    // ),
                    // const PopupMenuItem<SampleItem>(
                    //   value: SampleItem.itemThree,
                    //   child: Text('Item 3'),
                    // ),
                  ],
                ),
              ],
            )
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SuiviBloc()..add(GetPatientsEvent())),
        BlocProvider(create: (context) => ManageBloc()),
      ],
      child: const InnerMainSuivi(),
    );
  }
}
