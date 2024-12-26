part of '../../core/cores.dart';

class VisitePage extends StatefulWidget {
  const VisitePage({super.key});

  @override
  State<VisitePage> createState() => _VisitePageState();
}

class _VisitePageState extends State<VisitePage> {
  TextEditingController search = TextEditingController();
  User? user;

  @override
  void initState() {
    super.initState();
    _loadUserData(); // Charger les infos utilisateur à l'initialisation
  }

  Future<void> _loadUserData() async {
    User? userd = await loadUserData(); // Stocker les infos dans la variable
    setState(() {
      user = userd;
      print(userd!.idFsUser);
    });
  }

  // Méthode pour afficher le bottom dialog
  void _showBottomDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      sheetAnimationStyle: AnimationStyle(
        duration: const Duration(seconds: 2),
        reverseDuration: const Duration(seconds: 1),
      ),
      // constraints: const BoxConstraints(maxHeight: 300),
      builder: (BuildContext context) {
        return SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Filtre par date :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                10.verticalSpace,
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Aujourd\'hui',
                    style: TextStyle(fontSize: 18, color: Palette.foreign),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Hier',
                    style: TextStyle(fontSize: 18, color: Palette.foreign),
                  ),
                ),
                TextButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Personnalisé',
                      style: TextStyle(fontSize: 18, color: Palette.foreign),
                    ),
                    icon: const Icon(
                      Icons.calendar_month,
                      color: Palette.dark2,
                    )),
                CalendarSlider(
                  fullCalendarScroll: FullCalendarScroll.horizontal,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 140)),
                  lastDate: DateTime.now().add(const Duration(days: 4)),
                  onDateSelected: (date) {
                    print(date);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VisiteBloc()..add( GetVisites("2023-01-01", DateFormat('yyyy-MM-dd').format(DateTime.now()))),
      child: Scaffold(
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
            "Visites Domiciliaires",
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
                            controller: search,
                            hintText: "Recherche ...",
                            labelText: "Recherche..."),
                      ),
                      // const Spacer(),
                      5.horizontalSpace,
                      Container(
                         width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Palette.stroke, width: 2),

                      ),
                        child: IconButton(
                          onPressed: () {
                            _showBottomDialog(context);
                          },
                          icon: const Icon(
                            Icons.sort,
                            color: Palette.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
        body: const VisiteList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.addVisite);
          },
          backgroundColor: Palette.primary,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Palette.white,
          ),
        ),
      ),
    );
  }
}

class VisiteList extends StatelessWidget {
  const VisiteList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VisiteBloc, VisiteState>(
      listener: (context, state) {
        if (state is VisiteGetError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is VisiteGetYesterday) {
          context
              .read<VisiteBloc>()
              .add( GetVisites(DateFormat('yyyy-MM-dd').format(DateTime.now()), DateFormat('yyyy-MM-dd').format(DateTime.now())));
        }
      },
      child: BlocBuilder<VisiteBloc, VisiteState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     const Text(
                        "Visites",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.foreign),
                      ),
                      state is VisiteIsEmpty
                          ? const SizedBox(height: 0, width: 0)
                          : TextButton.icon(
                              onPressed: () {},
                              label: const Text(
                                "Voir tous",
                                style: TextStyle(color: Palette.foreign),
                              ),
                              icon: const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 15,
                                color: Palette.foreign,
                              ),
                              iconAlignment: IconAlignment.end,
                            )
                    ]),
              ),
              state is VisiteIsEmpty
                  ? const Center(
                      child: CircleAvatar(
                      radius: 20,
                      // backgroundColor: Palette.foreign,
                      // backgroundImage: AssetImage("assets/png/empty.png"),
                      child: Icon(Icons.folder_open_rounded,
                          color: Palette.primary),
                    ))
                  : state is VisiteGetLoaded
                      ? SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20, right: 20),
                            child: state is VisiteGetLoading
                                ? const CircularProgressIndicator.adaptive()
                                : CardVisiteCauserie(visites: state.visites),
                          ),
                        )
                      : state is VisiteGetLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(
                              semanticsLabel: "...",
                              backgroundColor: Palette.primary,
                            ))
                          : const SizedBox(),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  "Visites d'Aujourd'hui",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.foreign),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: state  is VisiteGetLoaded && state.todaysVisites.isNotEmpty ?
                      CardToday( state.todaysVisites) : state  is VisiteGetLoading ? const Center(child: Text('...')) : Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Column(
                              children: [
                                

                                const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Image(
                                    image: AssetImage(
                                      "assets/png/empty-box.png",
                                    ),
                                  ),
                                ),
                                5.verticalSpace,
                                const Text(
                                  "Aucune visite aujourd'hui",
                                  style: TextStyle(color: Palette.foreign),
                                ),
                              ],
                            ),
                          ),
                        ),
                  
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
