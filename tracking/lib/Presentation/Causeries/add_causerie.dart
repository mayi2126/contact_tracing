part of '../../core/cores.dart';

class AddCauserie extends StatefulWidget {
  const AddCauserie({super.key});

  @override
  State<AddCauserie> createState() => _AddCauserieState();
}

class _AddCauserieState extends State<AddCauserie> with RestorationMixin {
  String? restorationId = "causerie";

  List<String> listVillage = <String>[
    'Selectionner un village',
    'Agoe',
  ];

  List<String> listQuartier = <String>[
    'Selectionner un quartier',
    'Mamou',
  ];

  List<String> listTheme = <String>[
    'Selectionner un theme',
    'famille',
    'autre'
  ];
  String _villageValue = "";
  String _quartierValue = "";
  String _themeValue = "";
  final TextEditingController _formationSanitaire = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _nbrePersonnesTController = TextEditingController();
  final TextEditingController __nbrePersonnesTAllaitantesController = TextEditingController();
  final TextEditingController __nbrePersonnesTEnfantsController = TextEditingController();

  final TextEditingController __nbrePersonnesTHommesController = TextEditingController();
  final TextEditingController __nbrePersonnesTEnceintesController = TextEditingController();

  final TextEditingController __autresController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(DateTime.now().year),
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
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Ajouter une causerie",
          style: TextStyle(color: Palette.white, fontSize: 17),
        ),
      ),
      body: Container(
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
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Formation Sanitaire",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      CustomTextFormInput(
                        isReadonly: true,
                        labelText: "",
                        hintText: "CMS AGA",
                        controller: _formationSanitaire,
                        isPassword: true,
                      ),
                      10.verticalSpace,
                      const Text(
                        "Village",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                        initialSelection: "Agoe",
                        trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
                        selectedTrailingIcon:
                            Icon(Icons.keyboard_arrow_up_sharp),
                        onSelected: (String? value) {
                          setState(() {
                            _villageValue = value!;
                            print(_villageValue);
                          });
                        },
                        //TODOS: remove static width
                        width: getWidth(333),
                        dropdownMenuEntries: listVillage
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      10.verticalSpace,
                      const Text(
                        "Quartier",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                        // initialSelection: "Agoe",
                        initialSelection: "Mamou",
                        width: getWidth(333),

                        trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
                        selectedTrailingIcon:
                            Icon(Icons.keyboard_arrow_up_sharp),
                        // initialSelection: list.first,
                        onSelected: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            _quartierValue = value!;
                            print(_quartierValue);
                          });
                        },
                        dropdownMenuEntries: listQuartier
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
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
                        initialSelection: "famille",
                        trailingIcon: Icon(Icons.keyboard_arrow_down_sharp),
                        selectedTrailingIcon:
                            Icon(Icons.keyboard_arrow_up_sharp),
                        onSelected: (String? value) {
                          setState(() {
                            _themeValue = value!;
                          });
                        },
                        //TODOS: remove static width
                        width: getWidth(333),
                        dropdownMenuEntries: listTheme
                            .map<DropdownMenuEntry<String>>((String value) {
                          return DropdownMenuEntry<String>(
                              value: value, label: value);
                        }).toList(),
                      ),
                      10.verticalSpace,
                      PrimaryButton(
                        width: 2,
                        btnBgColor: Palette.primary,
                        textColor: Palette.contentPrimary,
                        btnText: "Suivant",
                        isFilledBtn: false,
                        onTapFunction: () {
                          setState(() {
                            _index++;
                          });
                        },
                      ),
                    ],
                  )
                : Column(
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
                          controller: __nbrePersonnesTEnceintesController,
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
                          controller: __nbrePersonnesTAllaitantesController,
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
                        10.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                btnBgColor: Palette.primary,
                                textColor: Palette.contentPrimary,
                                btnText: "Précédent",
                                isFilledBtn: false,
                                onTapFunction: () {
                                  setState(() {
                                    _index--;
                                  });
                                },
                              ),
                            ),
                            5.horizontalSpace,
                            Expanded(
                              child: PrimaryButton(
                                width: 2,
                                btnBgColor: Palette.primary,
                                textColor: Palette.contentPrimary,
                                btnText: "Enregistrer",
                                isFilledBtn: false,
                                onTapFunction: () {},
                              ),
                            )
                          ],
                        ),
                      ]),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
