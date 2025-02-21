part of "../../core/cores.dart";

class AddRecensement extends StatefulWidget {
  const AddRecensement({super.key});

  @override
  State<AddRecensement> createState() => _AddRecensementState();
}

class _AddRecensementState extends State<AddRecensement> {
  @override
  String _villageValue = "";
  String _quartierValue = "";
  final TextEditingController _formationSanitaire = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _localisationController = TextEditingController();
  final TextEditingController _numeroMenageController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final GlobalKey<FormState> _formKey_ = GlobalKey<FormState>();

  bool permissionGranted = false;
  bool gpsEnabled = false;
  l.Location location = l.Location();
  late StreamSubscription subscription;
  bool trackingEnabled = false;

  List<l.LocationData> locations = [];
  DateTime? selectedDate;

  User? user; // Variable pour stocker les infos utilisateur

  @override
  void dispose() {
    super.dispose();
    _formationSanitaire.dispose();
    _dateController.dispose();
    _localisationController.dispose();
    _numeroMenageController.dispose();
    _nomController.dispose();
    _prenomsController.dispose();
  }

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

  void checkStatus() async {
    bool permissionGranted = await isPermissionGranted();
    bool gpsEnabled = await isGpsEnabled();
    setState(() {
      permissionGranted = permissionGranted;
      gpsEnabled = gpsEnabled;
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
    // if (!(await isGpsEnabled())) {
    //   return;
    // }
    // if (!(await isPermissionGranted())) {
    //   return;
    // }
    // subscription = location.onLocationChanged.listen((event) {
    //   addLocation(event);
    // });

    setState(() {
      // print(locations.first.latitude);
      // print(locations.first.longitude);
      // print(locations.first.altitude);
      // print(locations);
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

  Future<void> _selectDate(BuildContext context) async {
    try {
      final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now(),
      ))!;
      if (picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          _dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
        });
      }
    } catch (e) {}
  }

  // Your other methods for location permissions, form submission, etc. remain the same

  void _onSubmitInfoGenRec(BuildContext context) {
    try {
      InfoGenRec infoGenRec = InfoGenRec(
        idquartier: int.parse("3"),
        daterecensement: selectedDate.toString(),
        localisationgpsrec: '6.8976789,3.456789',
        userEnreg: 0,
      );

      BlocProvider.of<RecensementBloc>(context)
          .add(StoreInfoGenRec(infoGenRec));
    } catch (e) {
      print(e);
    }
  }

  void _onSubmitChefMenage(BuildContext context) {
    try {
      Menage chefMenage = Menage(
          nomchefmenagerec: _nomController.text,
          prenomchefmenagerec: _prenomsController.text,
          userEnreg: 0); // Replace with your actual CheMenage

      print(chefMenage.nomchefmenagerec);

      BlocProvider.of<RecensementBloc>(context).add(AddChefMenage(chefMenage));
    } catch (e) {
      print(e);
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
          content: Form(
            key: _formKey_,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpaceFromWidth,
                const Text(
                  "Numéro de ménage",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //TODO:add number of menage
                CustomTextFormInput(
                  isReadonly: true,
                  labelText: "",
                  hintText: "MNG-C-KOUTOBA1",
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
                  validator:
                        Validatorless.required("Nom est requis"),
                  // isPassword: true,
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
                   validator:
                        Validatorless.required("Prénoms Nom est requis"),
                  // isPassword: true,
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
          ),
        );
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
          "Ajouter un recenement",
          style: TextStyle(color: Palette.white, fontSize: 17),
        ),
      ),
      body: BlocListener<RecensementBloc, RecensementState>(
        listener: (context, state) {
          // Handle any state changes if needed
          if (state is InfoGenRecStored) {
            Navigator.pop(context);

            PanaraInfoDialog.showAnimatedGrow(
              context,
              // title: "Hello",
              buttonTextColor: Palette.white,
              color: Palette.white,
              message: "Info recensement ajoutée avec succès",
              buttonText: "OK",
              onTapDismiss: () => Navigator.pop(context),
              panaraDialogType: PanaraDialogType.normal,
            );
          }
          if (state is InfoGenRecError) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
          if (state is InfoGenRecLoading) {
            showDialogCustom(context, "Enregistrement en cours...");
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Formation Sanitaire",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                //TODOS:  add formation sanitaire
                CustomTextFormInput(
                  isReadonly: true,
                  labelText: "",
                  hintText: user != null ? user!.name : "",
                  controller: _formationSanitaire,
                  // isPassword: true,
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
                        .add(FetchVillageQuartier(int.parse(_villageValue)));
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
                  isReadonly: true,
                  labelText: "",
                  hintText: "mm/jj/aaaa",
                  controller: _dateController,
                  keybordType: TextInputType.number,
                  icon: Icons.date_range,
                  validator: Validatorless.required("Date est requis"),
                  onTap: () {
                    _selectDate(context);
                  },
                ),
                10.verticalSpace,
                const Text(
                  "Localisation GPS",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                CustomTextFormInput(
                  isReadonly: true,
                  labelText: "",
                  hintText: trackingEnabled == false
                      ? "Utiliser votre position GPS pour le localiser"
                      : "6,8976789, 3,456789",
                  controller: _localisationController,
                  keybordType: TextInputType.number,
                  icon: Icons.location_on,
                  validator:
                      Validatorless.required("Coordonnées GPS est requis"),
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
                        onTapFunction: () {
                          if(_formKey.currentState!.validate()){
                            
                          _onSubmitInfoGenRec(context);
                          }
                        },
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
                          // if(_formKey.currentState!.validate()){
                            
                          dialogBuilder(context, () {
                            if(_formKey_.currentState!.validate()){
                              
                            _onSubmitChefMenage(context);
                            }
                          }, () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, RoutesName.addMember);
                          }, "Ajouter un Chef Ménage", "", "Enregistrer",
                              "Ajouter un membre de la famille");
                          }
                        // },
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

class AddRecensementScreen extends StatelessWidget {
  const AddRecensementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecensementBloc(),
      child:
          const AddRecensement(), // Now RecensementBloc is available in AddRecensement
    );
  }
}
