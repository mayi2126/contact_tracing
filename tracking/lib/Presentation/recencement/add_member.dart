part of '../../core/cores.dart';

class AddMemberPage extends StatefulWidget {
  const AddMemberPage({super.key});

  @override
  State<AddMemberPage> createState() => _AddMemberPageState();
}

class _AddMemberPageState extends State<AddMemberPage> with RestorationMixin {
  String? restorationId = "member";
  int _index = 0;

  final TextEditingController _numeroMenageController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();

  List<String> listSexe = <String>[
    'Homme',
    'Femme',
  ];
  List<String> listPrefession = <String>[
    'Selectionner un profession',
    'Commerçante',
  ];
  String _sexeValue = "";
  String _professionValue = "";

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
            "Ajouter des membres de la famille",
            style: TextStyle(color: Palette.white, fontSize: 17),
          ),
        ),
        body: Padding(
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
                            color:
                                _index == 1 ? Palette.primary : Palette.bgGrey))
                  ],
                ),
                _index == 0
                    ? Column(
                        children: [
                          15.verticalSpace,
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                  "Nom",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormInput(
                                  labelText: "",
                                  hintText: "Entrer le nom du membre",
                                  controller: _nomController,
                                  isPassword: true,
                                ),
                                10.verticalSpaceFromWidth,
                                const Text(
                                  "Prénoms (s)",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormInput(
                                  labelText: "",
                                  hintText: "Entrer le(s) prénoms du membre",
                                  controller: _prenomsController,
                                  isPassword: true,
                                ),
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
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          CircleAvatar(
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
                          )
                        ],
                      )
                    : Column(
                        children: [
                          15.verticalSpace,
                          Form(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Sexe",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                DropdownMenu<String>(
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
                                  initialSelection: "Homme",
                                  trailingIcon:
                                      Icon(Icons.keyboard_arrow_down_sharp),
                                  selectedTrailingIcon:
                                      Icon(Icons.keyboard_arrow_up_sharp),
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                DropdownMenu<String>(
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
                                  initialSelection: "Commerçante",
                                  trailingIcon:
                                      Icon(Icons.keyboard_arrow_down_sharp),
                                  selectedTrailingIcon:
                                      Icon(Icons.keyboard_arrow_up_sharp),
                                  onSelected: (String? value) {
                                    setState(() {
                                      _professionValue = value!;
                                      print(_professionValue);
                                    });
                                  },
                                  //TODOS: remove static width
                                  width: getWidth(333),
                                  dropdownMenuEntries: listPrefession
                                      .map<DropdownMenuEntry<String>>(
                                          (String value) {
                                    return DropdownMenuEntry<String>(
                                        value: value, label: value);
                                  }).toList(),
                                ),
                                10.verticalSpaceFromWidth,
                                const Text(
                                  "Contact",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormInput(
                                  labelText: "",
                                  hintText: "+228 98969856",
                                  controller: _contactController,
                                  isPassword: true,
                                ),
                                10.verticalSpaceFromWidth,
                                const Text(
                                  "Observation",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                CustomTextFormInput(
                                  labelText: "",
                                  hintText: "Observation",
                                  controller: _observationController,
                                  isPassword: true,
                                ),
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              Expanded(
                                child: PrimaryButton(
                                  btnText: "Enregistrer",
                                  width: double.infinity,
                                  textColor: Palette.white,
                                  isFilledBtn: true,
                                  onTapFunction: () {},
                                  btnBgColor: Palette.primary,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
              ]),
        ));
  }
}
