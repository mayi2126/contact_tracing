part of "../../core/cores.dart";

class AddRecensement extends StatefulWidget {
  const AddRecensement({super.key});

  @override
  State<AddRecensement> createState() => _addRecensementState();
}

class _addRecensementState extends State<AddRecensement> with RestorationMixin {
  @override
  String? restorationId = "main";

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


   bool permissionGranted = false;
  bool gpsEnabled = false;
  l.Location location = l.Location();
  late StreamSubscription subscription;
  bool trackingEnabled = false;
//start location
  List<l.LocationData> locations = [];

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
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
                textColor: Palette.white,
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

 void checkStatus() async {
    bool _permissionGranted = await isPermissionGranted();
    bool _gpsEnabled = await isGpsEnabled();
    setState(() {
      permissionGranted = _permissionGranted;
      gpsEnabled = _gpsEnabled;
    });
  }

  Future<bool> isPermissionGranted() async {
    return await Permission.locationWhenInUse.isGranted;
  }


  Future<bool> isGpsEnabled() async {
    return await Permission.location.serviceStatus.isEnabled;
  }

  void requestLocationPermission() async {
    PermissionStatus permissionStatus =
        await Permission.locationWhenInUse.request();
    if (permissionStatus == PermissionStatus.granted) {
      setState(() {
        permissionGranted = true;
      });
    } else {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  void addLocation(l.LocationData data) {
    setState(() {
      locations.insert(0, data);
    });
  }

  void clearLocation() {
    setState(() {
      locations.clear();
    });
  }

  void startTracking() async {
    if (!(await isGpsEnabled())) {
      return;
    }
    if (!(await isPermissionGranted())) {
      return;
    }
    subscription = location.onLocationChanged.listen((event) {
      addLocation(event);
    });

    setState(() {
      // print(locations.first.latitude);
      // print(locations.first.longitude);
      // print(locations.first.altitude);
      print(locations);
      trackingEnabled = true;
    });
  }

  void stopTracking() {
    subscription.cancel();
    setState(() {
      trackingEnabled = false;
    });
    clearLocation();
  }

  void _onSubmitInfoGenRec() {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecensementBloc(),
      child: Scaffold(
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
            "Ajouter un recenement",
            style: TextStyle(color: Palette.white, fontSize: 17),
          ),
        ),
        body: BlocListener<RecensementBloc, RecensementState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          child: Container(
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
                DropMenuVillage(
                  onSelected: (String? value) {
                    setState(() {
                      _villageValue = value!;
                      print(_villageValue);
                    });
                    context
                        .read<DataBloc>()
                        .add(FetchVillageQuartier(int.parse('12')));
                  },
                ),
                10.verticalSpace,
                _villageValue == ""
                    ? const SizedBox.shrink()
                    : const Text(
                        "Quartier",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                DropMenuQuartier(
                  onSelected: (String? value) {
                    setState(() {
                      _quartierValue = value!;
                      print("Quartier sélectionné: $_quartierValue");
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
                  "Localisation GPS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CustomTextFormInput(
                  labelText: "",
                  hintText:  trackingEnabled == false
                      ? "Utiliser votre position GPS pour le localiser"
                      : "${locations.first.latitude!}, ${locations.first.longitude!}",
                  controller: _localisationController,
                  keybordType: TextInputType.number,
                  icon: Icons.location_on,
                  onTap: () {
                    requestLocationPermission();

                    startTracking();
                  },
                ),
                10.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        btnBgColor: Palette.primary,
                        textColor: Palette.white,
                        btnText: "Enregistrer",
                        isFilledBtn: false,
                        onTapFunction: () {},
                      ),
                    ),
                    5.horizontalSpace,
                    Expanded(
                      child: PrimaryButton(
                        btnBgColor: Palette.primary,
                        textColor: Palette.white,
                        btnText: "Ajouter un Chef",
                        isFilledBtn: false,
                        onTapFunction: () {
                          dialogBuilder(context, () {}, () {
                            Navigator.pushNamed(context, RoutesName.addMember);
                          }, "Ajouter un Chef Ménage", "", "Enregistrer",
                              "Ajouter un membre de la famille");
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
