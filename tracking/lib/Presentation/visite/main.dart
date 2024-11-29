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
                    icon: Icon(
                      Icons.calendar_month,
                      color: Palette.dark2,
                    )),
                CalendarSlider(
                  fullCalendarScroll: FullCalendarScroll.horizontal,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(Duration(days: 140)),
                  lastDate: DateTime.now().add(Duration(days: 4)),
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
          VisiteBloc()..add(const GetVisites("2023-01-01", "2024-12-31")),
      child: Scaffold(
        appBar: AppBar(
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
                      2.horizontalSpace,
                      IconButton(
                        onPressed: () {
                          _showBottomDialog(context);
                        },
                        icon: const Icon(
                          Icons.filter_alt_sharp,
                          color: Palette.white,
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
          child: const Icon(
            Icons.add,
            color: Palette.white,
          ),
          shape: CircleBorder(),
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
        if (state is VisiteGetSearch) {
          context
              .read<VisiteBloc>()
              .add(const GetVisites("2023-01-01", "2023-12-31"));
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
                      Text(
                        "Visites",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.foreign),
                      ),
                      state is VisiteIsEmpty
                          ? SizedBox(height: 0, width: 0)
                          : TextButton.icon(
                              onPressed: () {},
                              label: Text(
                                "Voir tous",
                                style: TextStyle(color: Palette.foreign),
                              ),
                              icon: Icon(
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
                          ? Center(
                              child: const CircularProgressIndicator.adaptive(
                              semanticsLabel: "...",
                              backgroundColor: Palette.primary,
                            ))
                          : SizedBox(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Palette.primary),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Text("Van le de",
                                  style: TextStyle(
                                      color: Palette.primary,
                                      fontWeight: FontWeight.bold)),
                              const Spacer(),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.primary),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("culture",
                                    style: TextStyle(color: Palette.primary)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
