part of '../../../core/cores.dart';

class ShowPage extends StatefulWidget {
  const ShowPage({Key? key, required this.arguments}) : super(key: key);
  final VisiteModel arguments;

  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  late String _themeValue;
  late String _villageValue;
  late String _quartierValue;

  late TextEditingController _idelementDonneeController;
  late TextEditingController _nbrepersonnetoucheeFnqController;
  late TextEditingController _nbrepersonnetoucheeFEController;
  late TextEditingController _nbrepersonnetoucheeFAController;
  late TextEditingController _nbrepersonnetoucheeHController;
  late TextEditingController _nbreenfantsController;
  late TextEditingController _nbreautresController;
  late TextEditingController _lieuApController;
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();

    // Initialisation des contrôleurs avec les valeurs actuelles
    _themeValue = widget.arguments.idelementDonnee.toString();
    _villageValue = widget.arguments.idvillage.toString();
    _quartierValue = widget.arguments.idquartier.toString();
    _idelementDonneeController = TextEditingController(
        text: widget.arguments.idelementDonnee.toString());
    _nbrepersonnetoucheeFnqController = TextEditingController(
        text: widget.arguments.nbrepersonnetoucheeFnq.toString());
    _nbrepersonnetoucheeFEController = TextEditingController(
        text: widget.arguments.nbrepersonnetoucheeFe.toString());
    _nbrepersonnetoucheeFAController = TextEditingController(
        text: widget.arguments.nbrepersonnetoucheeFa.toString());
    _nbrepersonnetoucheeHController = TextEditingController(
        text: widget.arguments.nbrepersonnetoucheeH.toString());
    _nbreenfantsController = TextEditingController(
        text: widget.arguments.nbreenfantzvtouche.toString());
    _nbreautresController = TextEditingController(
        text: widget.arguments.nbreautrestouche.toString());
    _lieuApController =
        TextEditingController(text: widget.arguments.lieuAp.toString());

    selectedDate = DateTime.parse(widget.arguments.dateAp.toString());
  }

  @override
  void dispose() {
    // Libération des contrôleurs lorsque l'écran est supprimé
    _idelementDonneeController.dispose();
    _nbrepersonnetoucheeFnqController.dispose();
    _nbrepersonnetoucheeFEController.dispose();
    _nbrepersonnetoucheeFAController.dispose();
    _nbrepersonnetoucheeHController.dispose();
    _lieuApController.dispose();
    _nbreenfantsController.dispose();
    _nbreautresController.dispose();
    super.dispose();
  }

  // Fonction pour afficher le sélecteur de date
  Future<void> _selectDate(BuildContext context) async {
    // Affiche le sélecteur de date avec la date actuelle comme valeur par défaut

    try {
      final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(), // Valeur par défaut
        firstDate: DateTime(
            2000), // Date la plus ancienne que l'utilisateur peut choisir
        lastDate: DateTime
            .now(), // Date la plus récente que l'utilisateur peut choisir
      ))!;
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    } catch (e) {
     
    }
    // Utilisation de "!" pour forcer un non-null (si l'utilisateur ne ferme pas sans choisir)

    // Si une date a été choisie, la mettre à jour
  }

  @override
  Widget build(BuildContext context) {
    // Formater la date choisie pour l'affichage
    String formattedDate = selectedDate == null
        ? 'Aucune date choisie'
        : DateFormat('d MMMM yyyy', 'fr').format(selectedDate!);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/png/visite-removebg.png'),
                  fit: BoxFit.fitHeight,
                ),
                color: Palette.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      iconSize: 20,
                      splashRadius: 25,
                      style: IconButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                      ),
                      // color: Palette.white,
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Palette.primary,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Align(
                      alignment: Alignment(0.6, 1),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Palette.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 220,
            child: Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Palette.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  physics: const BouncingScrollPhysics(),  
                  children: <Widget>[
                    
                    TextField(
                      controller: _lieuApController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Lieu',
                      ),
                    ),
                    TextField(
                      controller: _nbreautresController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Autres personnes touchées',
                      ),
                    ),

                    TextField(
                      controller: _nbreenfantsController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nombre d\'enfants touchés',
                      ),
                    ),
                    TextField(
                      controller: _nbrepersonnetoucheeFnqController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nombre de personnes touchées FNQ',
                      ),
                    ),
                    TextField(
                      controller: _nbrepersonnetoucheeFEController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nombre de personnes touchées FE',
                      ),
                    ),
                    TextField(
                      controller: _nbrepersonnetoucheeFAController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nombre de personnes touchées FA',
                      ),
                    ),
                    TextField(
                      controller: _nbrepersonnetoucheeHController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Nombre de personnes touchées H',
                      ),
                    ),
                    Text("Thème de la causerie"),
                    DropMenuTheme(
                      onSelected: (String? value) {
                        setState(() {
                          _themeValue = value!;
                          print(_themeValue);
                        });
                      },
                      type: 'ACTIVITÉS PRÉVENTIVES ',
                      id: widget.arguments.idelementDonnee,
                    ),
                    8.verticalSpace,
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
                      nom: widget.arguments.nomvillage,
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
                          print("Quartier sélectionné: $_quartierValue");
                        });
                      },
                      id: widget.arguments.idquartier,
                    ),

                    8.verticalSpace,
                    // Affichage de la date choisie

                    // Bouton pour ouvrir le sélecteur de date
                    const Text(
                      "Date de la visite",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: '$formattedDate',
                          border: InputBorder.none,
                          suffixIcon: IconButton(
                              onPressed: () => _selectDate(context),
                              icon: Icon(Icons.calendar_month)),
                        )),

                    const SizedBox(height: 20),
                    PrimaryButton(
                      width: 2,
                      btnBgColor: Palette.primary,
                      textColor: Palette.white,
                      btnText: "Enregistrer les modifications",
                      isFilledBtn: false,
                      onTapFunction: () {
                        // Future.delayed(
                        //     const Duration(seconds: 1), () {

                        // });

                        // Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),

          // Positioned
        ],
      ),
    );
  }
}
