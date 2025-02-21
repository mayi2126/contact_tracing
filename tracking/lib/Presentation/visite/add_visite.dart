part of '../../core/cores.dart';

class AddVisitePage extends StatefulWidget {
  const AddVisitePage({super.key});

  @override
  State<AddVisitePage> createState() => _AddVisitePageState();
}

class _AddVisitePageState extends State<AddVisitePage> with RestorationMixin {
  @override
  String? restorationId = "causerie";

  String _villageValue = "";
  String _quartierValue = "";
  String _label = "";
  String _themeValue = "";
  final TextEditingController _formationSanitaire = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _nbrePersonnesTController =
      TextEditingController(text: "0");
  final TextEditingController __nbrePersonnesTAllaitantesController =
      TextEditingController(text: "0");
  final TextEditingController __nbrePersonnesTEnfantsController =
      TextEditingController(text: "0");

  final TextEditingController __nbrePersonnesTHommesController =
      TextEditingController(text: "0");
  final TextEditingController __nbrePersonnesTEnceintesController =
      TextEditingController(text: "0");

  final TextEditingController __autresController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  int _index = 0;
  User? user; // Variable pour stocker les infos utilisateur

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user_info');

    if (userJson != null) {
      setState(() {
        user = User.fromJson(
            jsonDecode(userJson)); // Stocker les infos dans la variable
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Charger les infos utilisateur à l'initialisation
  }

  @override
  void dispose() {
    _selectedDate.dispose();
    _restorableDatePickerRouteFuture.dispose();
    super.dispose();
    _nbrePersonnesTController.dispose();
    __autresController.dispose();
    __nbrePersonnesTEnceintesController.dispose();
    __nbrePersonnesTHommesController.dispose();
    __nbrePersonnesTEnfantsController.dispose();
    __nbrePersonnesTAllaitantesController.dispose();
    _formationSanitaire.dispose();
    _dateController.dispose();
    _localisationController.dispose();
  }

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments as int),
          firstDate: DateTime(2021, 1, 1), // Première date : 1er janvier 1900
          lastDate: DateTime.now(), // Dernière date : aujourd'hui
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        _dateController.text =
            '${_selectedDate.value.year}-${_selectedDate.value.month}-${_selectedDate.value.day}';
      });
    }
  }

  _onSubmit(BuildContext context) {
    if (_formKey2.currentState!.validate()) {
      // _formKey.currentState!.save();

      // Visite visite = Visite(
      //   idFsAp: 10, // ID de la formation sanitaire
      //   dateAp: "2024-10-23", // Date au format ISO
      //   lieuAp: "Quartier ABC", // Lieu de la visite
      //   nbrepersonnetoucheeFnq: 50, // Nombre total de personnes touchées
      //   nbrepersonnetoucheeFa: 10, // Nombre de personnes allaitantes touchées
      //   nbreenfantzvtouche: 20, // Nombre d'enfants touchés
      //   nbrepersonnetoucheeH: 15, // Nombre d'hommes touchés
      //   nbrepersonnetoucheeFe: 5, // Nombre de femmes enceintes touchées
      //   nbreautrestouche: 3, // Autres personnes touchées
      //   idvillage: 5, // ID fictif du village
      //   idquartier: 6, // ID fictif du quartier
      //   idelementDonnee: 7, // Valeur du thème
      //   idAscAp: 10, // ID fictif de l'ASC
      //   userEnreg: 10, // ID fictif de l'utilisateur
      // );()

      try {
        Visite visite = Visite(
          libelementdedonnee: _label,
          idFsAp: 0,
          dateAp: _dateController.text,
          lieuAp: _localisationController.text,
          nbrepersonnetoucheeFnq: int.parse(_nbrePersonnesTController.text),
          nbrepersonnetoucheeFa:
              int.parse(__nbrePersonnesTAllaitantesController.text),
          nbreenfantzvtouche: int.parse(__nbrePersonnesTEnfantsController.text),
          nbrepersonnetoucheeH:
              int.parse(__nbrePersonnesTHommesController.text),
          nbrepersonnetoucheeFe:
              int.parse(__nbrePersonnesTEnceintesController.text),
          nbreautrestouche: __autresController.text,
          idvillage: int.parse(_villageValue),
          idquartier: int.parse("12"),
          idelementDonnee: int.parse(_themeValue),
          idAscAp: 0,
          userEnreg: 0,
        );

        context.read<VisiteBloc>().add(AddVisiteDomicile(visite));
      } catch (e) {
        PanaraInfoDialog.showAnimatedGrow(
          context,
          // title: "Hello",
          message: e.toString(),
          buttonText: "Okay",
          onTapDismiss: () {
            Navigator.pop(context);
          },
          panaraDialogType: PanaraDialogType.error,
        );
      }
    }
  }

  Widget _dropDownQuartier(String id) {
    return DropMenuQuartier(
      onSelected: (String? value) {
        setState(() {
          _quartierValue = value!;
          print("Quartier sélectionné: $_quartierValue");
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              context.read<DataBloc>().add(QuartierReset());
              Navigator.pop(context);
            }),
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Ajouter une visite domicieliaire",
          style: TextStyle(color: Palette.white, fontSize: 17),
        ),
      ),
      body: BlocListener<VisiteBloc, VisiteState>(
        listener: (context, state) {
          if (state is VisiteLoading) {
            showDialogCustom(context, "En cours de sauvegarde ...");
          }

          if (state is VisiteAdded) {
            Navigator.pushReplacementNamed(context, RoutesName.visite);
          }
          if (state is VisiteError) {
            Navigator.pop(context);
            PanaraInfoDialog.showAnimatedGrow(
              context,
              // title: "Hello",
              message: "Erreur lors de l'ajout de la visite",
              buttonText: "Okay",
              onTapDismiss: () {
                Navigator.pop(context);
              },
              panaraDialogType: PanaraDialogType.error,
            );
          }
        },
        child: BlocBuilder<VisiteBloc, VisiteState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(
                        child: Container(
                      height: 5,
                      color: _index == 0 ? Palette.primary : Palette.bgGrey,
                    )),
                    5.horizontalSpace,
                    Expanded(
                        child: Container(
                      height: 5,
                      color: _index == 1 ? Palette.primary : Palette.bgGrey,
                    ))
                  ]),
                  10.verticalSpace,
                  _index == 0
                      ? Expanded(
                          child: Form(
                            key: _formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Formation Sanitaire",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CustomTextFormInput(
                                    isReadonly: true,
                                    labelText: "",
                                    hintText: user != null ? user!.name : "",
                                    controller: _formationSanitaire,
                                    isPassword: false,
                                  ),
                                  10.verticalSpace,
                                  const Text(
                                    "Village",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  DropMenuVillage(
                                    onSelected: (String? value) {
                                      setState(() {
                                        _villageValue = value!;
                                        print(_villageValue);
                                      });
                                      context.read<DataBloc>().add(
                                          FetchVillageQuartier(
                                              int.parse(_villageValue)));
                                    },
                                  ),
                                  10.verticalSpace,
                                  _villageValue != ''
                                      ? const Text(
                                          "Quartier",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const SizedBox.shrink(),
                                  _dropDownQuartier(_villageValue),
                                  10.verticalSpace,
                                  const Text(
                                    "Date",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CustomTextFormInput(
                                    labelText: "",
                                    hintText: "mm/jj/aaaa",
                                    controller: _dateController,
                                    keybordType: TextInputType.number,
                                    icon: Icons.date_range,
                                    validator: Validatorless.required(
                                        "Date est requise"),
                                    onTap: () {
                                      _restorableDatePickerRouteFuture
                                          .present();
                                    },
                                  ),
                                  10.verticalSpace,
                                  const Text(
                                    "Lieu",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CustomTextFormInput(
                                    labelText: "",
                                    hintText: "",
                                    controller: _localisationController,
                                    keybordType: TextInputType.text,
                                    validator: Validatorless.required(
                                        "Lieu est requis"),
                                  ),
                                  10.verticalSpace,
                                  const Text(
                                    "Motif",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  DropMenuMotif(
                                    onSelected: (String? value) {
                                      setState(() {
                                        List<String> parts = value!.split(':');
                                        _themeValue = parts[0];
                                        _label = parts[1];

                                        print(_themeValue);
                                      });
                                    },
                                    // type: 'ACTIVITÉS PRÉVENTIVES ',
                                  ),
                                  20.verticalSpace,
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: Palette.primary,
                                      radius: 25,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.arrow_forward,
                                          color: Palette.white,
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _index++;
                                            });
                                          }
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Expanded(
                          child: Form(
                            key: _formKey2,
                            child: SingleChildScrollView(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (9 - 49 ans)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller: _nbrePersonnesTController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                      validator: Validatorless.multiple([
                                        Validatorless.required(
                                            "Nombre de personnes touchées obligatoire"),
                                        Validatorless.number(
                                            "Doit etre un nombre")
                                      ]),
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (Femmes enceintes",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller:
                                          __nbrePersonnesTEnceintesController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                      validator: Validatorless.multiple([
                                        Validatorless.required(
                                            "Nombre de femmes enceintes obligatoire"),
                                        Validatorless.number(
                                            "Doit etre un nombre")
                                      ]),
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (Femmes allaitantes)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller:
                                          __nbrePersonnesTAllaitantesController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                      validator: Validatorless.multiple([
                                        Validatorless.required(
                                            "Nombre de femmes allaitantes obligatoire"),
                                        Validatorless.number(
                                            "Doit etre un nombre")
                                      ]),
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (Hommes)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller:
                                          __nbrePersonnesTHommesController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                      validator: Validatorless.multiple([
                                        Validatorless.required(
                                            "Nombre d'hommes touchés est requis"),
                                        Validatorless.number(
                                            "Doit etre un nombre")
                                      ]),
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre d'enfants de 0 a 24 mois visité",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller:
                                          __nbrePersonnesTEnfantsController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                      validator: Validatorless.multiple([
                                        Validatorless.required(
                                            "Nombre d'enfants est requis"),
                                        Validatorless.number(
                                            "Doit etre un nombre")
                                      ]),
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Autres",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "Autres",
                                      controller: __autresController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                    ),
                                    20.verticalSpace,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: CircleAvatar(
                                            backgroundColor: Palette.primary,
                                            radius: 25,
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.arrow_back,
                                                color: Palette.white,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  _index--;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        5.horizontalSpace,
                                        Expanded(
                                          flex: 2,
                                          child: PrimaryButton(
                                            width: 2,
                                            btnBgColor: Palette.primary,
                                            textColor: Palette.white,
                                            btnText: "Enregistrer",
                                            isFilledBtn: false,
                                            onTapFunction: () {
                                              // Future.delayed(
                                              //     const Duration(seconds: 1), () {

                                              // });

                                              // Navigator.pop(context);
                                              if (_formKey2.currentState!
                                                  .validate()) {
                                                _onSubmit(context);
                                              }
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                  10.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
