part of "../../core/cores.dart";

class AddRecensement extends StatefulWidget {
  const AddRecensement({super.key});

  @override
  State<AddRecensement> createState() => _addRecensementState();
}

class _addRecensementState extends State<AddRecensement> with RestorationMixin {
  String? restorationId = "main";
  List<String> listVillage = <String>[
    'Selectionner un village',
    'Agoe',
  ];

  List<String> listQuartier = <String>[
    'Selectionner un quartier',
    'Mamou',
  ];

  String _villageValue = "";
  String _quartierValue = "";
  final TextEditingController _formationSanitaire = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _numeroMenageController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomsController = TextEditingController();

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

  Future<void> dialogBuilder(
    BuildContext context,
    void Function() onTapPrimary,
    void Function() onTapSecondary,
    String title,
    String subTitle,
    String primaryBtnText,
    String secondaryBtnText,
  ) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Palette.white,
          title: Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            // textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpaceFromWidth,
              const Text(
                "Numéro de ménage",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextFormInput(
                isReadonly: true,
                labelText: "",
                hintText: "NME 123466",
                controller: _numeroMenageController,
                isPassword: true,
              ),
              10.verticalSpaceFromWidth,
              const Text(
                "Nom du Chef",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextFormInput(
                labelText: "",
                hintText: "Entrer le nom du chef",
                controller: _nomController,
                isPassword: true,
              ),
              10.verticalSpaceFromWidth,
              const Text(
                "Prénoms du Chef",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              CustomTextFormInput(
                labelText: "",
                hintText: "Entrer le(s) prénoms du chef",
                controller: _prenomsController,
                isPassword: true,
              ),
              10.verticalSpaceFromWidth,
              PrimaryButton(
                btnText: primaryBtnText,
                width: double.infinity,
                isFilledBtn: true,
                onTapFunction: onTapPrimary,
                btnBgColor: Palette.primary,
              ),
              10.verticalSpaceFromWidth,
              PrimaryButton(
                btnText: secondaryBtnText,
                width: double.infinity,
                isFilledBtn: true,
                onTapFunction: onTapSecondary,
                textColor: Palette.primary,
                btnBgColor: Palette.white,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primary,
        iconTheme: const IconThemeData(color: Palette.white),
        title: const Text(
          "Ajouter un recenement",
          style: TextStyle(color: Palette.white, fontSize: 17),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
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
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_sharp),
              onSelected: (String? value) {
                setState(() {
                  _villageValue = value!;
                  print(_villageValue);
                });
              },
              //TODOS: remove static width
              width: getWidth(333),
              dropdownMenuEntries:
                  listVillage.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
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
              selectedTrailingIcon: Icon(Icons.keyboard_arrow_up_sharp),
              // initialSelection: list.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  _quartierValue = value!;
                  print(_quartierValue);
                });
              },
              dropdownMenuEntries:
                  listQuartier.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
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
              "Localisation GPS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            CustomTextFormInput(
              labelText: "",
              hintText: "Entrer la localisation ou cliquer pour obtenir",
              controller: _localisationController,
              keybordType: TextInputType.number,
              icon: Icons.location_on,
              onTap: () {},
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    btnBgColor: Palette.primary,
                    textColor: Palette.contentPrimary,
                    btnText: "Enregistrer",
                    isFilledBtn: false,
                    onTapFunction: () {},
                  ),
                ),
                5.horizontalSpace,
                Expanded(
                  child: PrimaryButton(
                    btnBgColor: Palette.primary,
                    textColor: Palette.contentPrimary,
                    btnText: "Ajouter un Chef",
                    isFilledBtn: false,
                    onTapFunction: () {
                      dialogBuilder(
                          context,
                          () {},
                          () {},
                          "Ajouter un Chef Ménage",
                          "",
                          "Enregistrer",
                          "Ajouter un membre de la famille");
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
