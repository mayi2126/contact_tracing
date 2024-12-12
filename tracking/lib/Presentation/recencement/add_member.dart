part of '../../core/cores.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> {
  @override
  int _index = 0;

  final TextEditingController _numeroMenageController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();
  final TextEditingController ageYearsController = TextEditingController();
  final TextEditingController ageMonthsController = TextEditingController();
  DateTime? selectedDate;

  List<String> listSexe = <String>[
    'Homme',
    'Femme',
  ];
 
  String _sexeValue = "";
  String _professionValue = "";

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      ))!;
      if (picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          birthDate = picked;
          _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
          calculateAgeFromBirthDate();
        });
      }
    } catch (e) {}
  }

  // Variables pour stocker les valeurs calculées
  DateTime? birthDate;
  int? ageInYears;
  int? ageInMonths;

  // Fonction pour calculer l'âge en années et en mois
  void calculateAgeFromBirthDate() {
    if (birthDate != null) {
      DateTime currentDate = DateTime.now();
      int years = currentDate.year - birthDate!.year;
      if (currentDate.month < birthDate!.month ||
          (currentDate.month == birthDate!.month &&
              currentDate.day < birthDate!.day)) {
        years--;
      }
      int months = (currentDate.year - birthDate!.year) * 12 +
          currentDate.month -
          birthDate!.month;
      if (currentDate.day < birthDate!.day) {
        months--;
      }

      setState(() {
        ageInYears = years;
        ageInMonths = months;
        ageYearsController.text = ageInYears.toString();
        ageMonthsController.text = ageInMonths.toString();
      });
    }
  }

  // Fonction pour calculer la date de naissance à partir de l'âge en années et en mois
  void calculateBirthDateFromAge() {
    if (ageInYears != null && ageInYears! >= 0) {
      DateTime currentDate = DateTime.now();

      // Calcul de l'année de naissance en soustrayant l'âge de l'année actuelle
      int birthYear = currentDate.year - ageInYears!;

      ageInMonths = int.parse(ageYearsController.text) * 12;

      // La date de naissance sera au même jour et mois que la date actuelle, mais dans l'année de naissance calculée
      setState(() {
        birthDate = DateTime(birthYear, currentDate.month, currentDate.day);
        selectedDate = birthDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(birthDate!);
        ageMonthsController.text = ageInMonths.toString();
      });
    }
  }

  void _onSubmit(BuildContext context) {

    print(_dateController.text);
    try {
      Member menage = Member(
        membredatenaissrec: DateTime.parse(_dateController.text),
        userEnreg: 0,
        membrenomrec: _nomController.text,
        membreprenomrec: _prenomsController.text,
        membreagerec: ageInYears!,
        agemois: ageInMonths!,
        sexezerovingtquatremoisrec: _sexeValue,
        contactrec: _contactController.text,
        observationrec: _observationController.text,
        idprofessionref: int.parse(_professionValue),
      );

      // Enregistrer le membre dans la base de données
      BlocProvider.of<RecensementBloc>(context).add(AddMenageMember(menage));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'enregistrement: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    ageMonthsController.text = '0';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primary,
          iconTheme: const IconThemeData(color: Palette.white),
          title: const Text(
            "Ajouter des membres de la famille",
            style: TextStyle(color: Palette.white, fontSize: 17),
          ),
        ),
        body: BlocListener<RecensementBloc, RecensementState>(
          listener: (context, state) {
            if (state is MenageMemberLoading) {
              showDialogCustom(context, "Enregistrement en cours...");
            }
            if (state is MenageMemberStored) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content:  Text("Le membre a été ajoutée avec succès"),
                ),
              );

             PanaraConfirmDialog.showAnimatedGrow(
                  context,
                  title: "Voulez-vous terminer l'enregistrement ?",
                  message: "Ou voulez-vous continuer ?",
                  confirmButtonText: "Terminer",
                  cancelButtonText: "Continuer",
                  onTapCancel: () {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, RoutesName.addRecensement);
                  },
                  onTapConfirm: () {
                    Navigator.pop(context);
                    BlocProvider.of<RecensementBloc>(context).add(const ConfirmationRecensement());
                  },
                  panaraDialogType: PanaraDialogType.warning,
                );
            }

            if (state is MenageMemberError) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }

            if(state is ConfirmationRecensementLoading){
              showDialogCustom(context, "Confirmation en cours...");
            }

            if(state is ConfirmationRecensementSuccess){
              Navigator.pop(context);

              PanaraInfoDialog.showAnimatedGrow(
                context,
                title: "Confirmation",
                message: "La recensement a été terminer avec succès",
                buttonText: "Ok",
                panaraDialogType: PanaraDialogType.success,
                barrierDismissible: false,
                onTapDismiss: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, RoutesName.mainRecensement);
                }
              );
            }

            if(state is ConfirmationRecensementError){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              height: 5,
                              color: _index == 0
                                  ? Palette.primary
                                  : Palette.bgGrey)),
                      5.horizontalSpace,
                      Expanded(
                          child: Container(
                              height: 5,
                              color: _index == 1
                                  ? Palette.primary
                                  : Palette.bgGrey))
                    ],
                  ),
                  _index == 0
                      ? Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                15.verticalSpace,
                                Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Numéro de ménage",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        isReadonly: true,
                                        labelText: "",
                                        hintText: "NME 123466",
                                        controller: _numeroMenageController,
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Nom",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText: "Entrer le nom du membre",
                                        controller: _nomController,
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Prénoms (s)",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText:
                                            "Entrer le(s) prénoms du membre",
                                        controller: _prenomsController,
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Date de naissance",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText: "mm/jj/aaaa",
                                        controller: _dateController,
                                        keybordType: TextInputType.number,
                                        icon: Icons.date_range,
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Age en mois",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText: "0",
                                        controller: ageMonthsController,
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Age en années",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText: "0",
                                        controller: ageYearsController,
                                        onChange: (value) {
                                          setState(() {
                                            try {
                                              ageInYears = int.parse(value);
                                              calculateBirthDateFromAge();
                                            } catch (e) {
                                              _dateController.text = "";
                                              ageInYears = 0;
                                              ageInMonths = 0;

                                              ageMonthsController.text = "0";
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                20.verticalSpace,
                                CircleAvatar(
                                  backgroundColor: Palette.primary,
                                  radius: 25,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                      color: Palette.white,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _index++;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                15.verticalSpace,
                                Form(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Sexe",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      DropdownMenu<String>(
                                        inputDecorationTheme:
                                            InputDecorationTheme(
                                          filled: true,
                                          fillColor: Palette.bgGrey,
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
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
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        initialSelection: "Homme",
                                        trailingIcon: const Icon(
                                            Icons.keyboard_arrow_down_sharp),
                                        selectedTrailingIcon: const Icon(
                                            Icons.keyboard_arrow_up_sharp),
                                        onSelected: (String? value) {
                                          setState(() {
                                            _sexeValue = value!;
                                            print(_sexeValue);
                                          });
                                        },
                                        //TODOS: remove static width
                                        width: getWidth(333),
                                        dropdownMenuEntries: listSexe
                                            .map<DropdownMenuEntry<String>>(
                                                (String value) {
                                          return DropdownMenuEntry<String>(
                                              value: value, label: value);
                                        }).toList(),
                                      ),
                                      10.verticalSpace,
                                      const Text(
                                        "Profession",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      DropMenuProfession(
                                        onSelected: (String? value) {
                                          setState(() {
                                            _professionValue = value!;
                                            print(
                                                "profession sélectionnée: $_professionValue");
                                          });
                                        },
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Contact",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText: "+228 98969856",
                                        controller: _contactController,
                                      ),
                                      10.verticalSpaceFromWidth,
                                      const Text(
                                        "Observation",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CustomTextFormInput(
                                        labelText: "",
                                        hintText: "Observation",
                                        controller: _observationController,
                                      ),
                                    ],
                                  ),
                                ),
                                20.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    Expanded(
                                      child: PrimaryButton(
                                        btnText: "Enregistrer",
                                        width: double.infinity,
                                        textColor: Palette.white,
                                        isFilledBtn: true,
                                        onTapFunction: () {
                                          _onSubmit(context);
                                        },
                                        btnBgColor: Palette.primary,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                ]),
          ),
        ));
  }
}

class AddMenageMemberScreen extends StatelessWidget {
  const AddMenageMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecensementBloc(),
      child: const AddMemberPage(),
    );
  }
}
