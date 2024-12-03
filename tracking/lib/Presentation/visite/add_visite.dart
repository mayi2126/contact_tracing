part of '../../core/cores.dart';

class AddVisitePage extends StatefulWidget {
  const AddVisitePage({super.key});

  @override
  State<AddVisitePage> createState() => _AddVisitePageState();
}

class _AddVisitePageState extends State<AddVisitePage> with RestorationMixin {
  String? restorationId = "causerie";

  String _villageValue = "";
  String _quartierValue = "";
  String _themeValue = "";
  final TextEditingController _formationSanitaire = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _nbrePersonnesTController =
      TextEditingController();
  final TextEditingController __nbrePersonnesTAllaitantesController =
      TextEditingController();
  final TextEditingController __nbrePersonnesTEnfantsController =
      TextEditingController();

  final TextEditingController __nbrePersonnesTHommesController =
      TextEditingController();
  final TextEditingController __nbrePersonnesTEnceintesController =
      TextEditingController();

  final TextEditingController __autresController = TextEditingController(text:'0');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  int _index = 0;


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

      print(_villageValue);
      print(_quartierValue);

      Visite _visite = Visite(
        idFsAp: 0,
        dateAp: _dateController.text,
        lieuAp: _localisationController.text,
        nbrepersonnetoucheeFnq: int.parse(_nbrePersonnesTController.text),
        nbrepersonnetoucheeFa:
            int.parse(__nbrePersonnesTAllaitantesController.text),
        nbreenfantzvtouche: int.parse(__nbrePersonnesTEnfantsController.text),
        nbrepersonnetoucheeH: int.parse(__nbrePersonnesTHommesController.text),
        nbrepersonnetoucheeFe:
            int.parse(__nbrePersonnesTEnceintesController.text),
        nbreautrestouche: int.parse(__autresController.text),
        idvillage: int.parse(_villageValue),
        idquartier: int.parse(_quartierValue),
        idelementDonnee: int.parse(_themeValue),
        idAscAp: 0,
        userEnreg: 0,
      );

      context.read<VisiteBloc>().add(AddVisiteDomicile(_visite));
    }
  }


 
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
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
            showDialogCustom(context, state.message);
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
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CustomTextFormInput(
                                    isReadonly: true,
                                    labelText: "",
                                    hintText: "FS-19",
                                    controller: _formationSanitaire,
                                    isPassword: false,
                                  ),
                                  10.verticalSpace,
                                  const Text(
                                    "Village",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                              
                                  DropMenuVillage(
                                    onSelected: (String? value) {
                                      setState(() {
                                        _villageValue = value!;
                                        print(_villageValue);
                                      });
                                    },
                                  ),
                              
                                  10.verticalSpace,
                                  const Text(
                                    "Quartier",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  DropMenuQuartier(
                                    onSelected: (String? value) {
                                      setState(() {
                                        _quartierValue = value!;
                                        print(
                                            "Quartier sélectionné: $_quartierValue");
                                      });
                                    },
                                  ),
                              
                                  10.verticalSpace,
                                  const Text(
                                    "Date",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CustomTextFormInput(
                                    labelText: "",
                                    hintText: "mm/jj/aaaa",
                                    controller: _dateController,
                                    keybordType: TextInputType.number,
                                    icon: Icons.date_range,
                                    onTap: () {
                                      _restorableDatePickerRouteFuture.present();
                                    },
                                  ),
                                  10.verticalSpace,
                                  const Text(
                                    "Lieu",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  CustomTextFormInput(
                                    labelText: "",
                                    hintText: "",
                                    controller: _localisationController,
                                    keybordType: TextInputType.text,
                                    onTap: () {},
                                  ),
                                  10.verticalSpace,
                                  const Text(
                                    "Thème",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  // DropdownMenu<String>(
                                  //   inputDecorationTheme: InputDecorationTheme(
                                  //     filled: true,
                                  //     fillColor: Palette.bgGrey,
                                  //     focusedBorder: const OutlineInputBorder(
                                  //       borderRadius:
                                  //           BorderRadius.all(Radius.circular(10)),
                                  //       borderSide: BorderSide(
                                  //         color: Palette.primary,
                                  //         width: 2,
                                  //       ),
                                  //     ),
                                  //     enabledBorder: OutlineInputBorder(
                                  //       borderSide: const BorderSide(
                                  //         color: Palette.stroke,
                                  //         width: 2,
                                  //       ),
                                  //       borderRadius: BorderRadius.circular(10),
                                  //     ),
                                  //   ),
                                  //   initialSelection: "famille",
                                  //   trailingIcon:
                                  //       Icon(Icons.keyboard_arrow_down_sharp),
                                  //   selectedTrailingIcon:
                                  //       Icon(Icons.keyboard_arrow_up_sharp),
                                  //   onSelected: (String? value) {
                                  //     setState(() {
                                  //       _themeValue = value!;
                                  //     });
                                  //   },
                                  //   //TODOS: remove static width
                                  //   width: getWidth(333),
                                  //   dropdownMenuEntries: listTheme
                                  //       .map<DropdownMenuEntry<String>>(
                                  //           (String value) {
                                  //     return DropdownMenuEntry<String>(
                                  //         value: value, label: value);
                                  //   }).toList(),
                                  // ),
                              
                                  DropMenuTheme(
                                    onSelected: (String? value) {
                                      setState(() {
                                        _themeValue = value!;
                                        print(_themeValue);
                                      });
                                    },
                                    type: 'ACTIVITÉS PRÉVENTIVES ',
                                  ),
                              
                                  20.verticalSpace,
                                  Center(
                                    child: CircleAvatar(
                                      backgroundColor: Palette.primary,
                                      radius: 25,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Palette.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _index++;
                                          });
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
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller: _nbrePersonnesTController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (Femmes enceintes",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller:
                                          __nbrePersonnesTEnceintesController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (Femmes allaitantes)",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller:
                                          __nbrePersonnesTAllaitantesController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre de personnes touchées (Hommes)",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller: __nbrePersonnesTHommesController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Nombre d'enfants de 0 a 24 mois visité",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
                                      controller: __nbrePersonnesTEnfantsController,
                                      keybordType: TextInputType.number,
                                      onTap: () {},
                                    ),
                                    10.verticalSpace,
                                    const Text(
                                      "Autres",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    CustomTextFormInput(
                                      labelText: "",
                                      hintText: "0",
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
                                              icon: Icon(
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
                                              _onSubmit(context);
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
