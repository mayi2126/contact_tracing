part of '../../core/cores.dart';

class CauseriePage extends StatefulWidget {
  const CauseriePage({super.key});

  @override
  State<CauseriePage> createState() => _CauseriePageState();
}

class _CauseriePageState extends State<CauseriePage> {
  final TextEditingController _searchController = TextEditingController();

  List<VisiteModel> _filteredCauseries= [];
  List<VisiteModel> _filteredCauseriesAll = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterVisites);
  }

  void _filterVisites() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredCauseries = _filteredCauseriesAll;
      }
      // Filtrer les `contreCauseries` en fonction de la recherche
      _filteredCauseries= _filteredCauseriesAll
          .where((causerie) =>
              causerie.libelementdedonnee.toLowerCase().contains(query) ||
              causerie.lieuAp.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CauserieBloc()..add(const GetCauseries("2023-01-01", "2024-12-31")),
      child: Scaffold(
        backgroundColor: Palette.primary,
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
            "Causeries Educatives",
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
                            controller: _searchController,
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
                          onPressed: () {},
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
        body: BlocListener<CauserieBloc, CauserieState>(
          listener: (context, state) {
            if (state is CauserieGetError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
            else if (state is CauserieGetSearch) {
              context.read<CauserieBloc>().add(GetCauseries("2023-01-01",
                  DateFormat('yyyy-MM-dd').format(DateTime.now())));
            }

            else if (state is CauserieGetLoaded) {
              _filteredCauseries = state.causeries;
              _filteredCauseriesAll = state.causeries;
            }
          },
          child: BlocBuilder<CauserieBloc, CauserieState>(
            builder: (context, state) {
              return Container(
                 height: double.infinity,
        width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Causeries",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.foreign),
                            ),
                            state is CauserieIsEmpty
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
                    state is CauserieIsEmpty
                        ? const Center(
                            child: CircleAvatar(
                            radius: 20,
                            // backgroundColor: Palette.foreign,
                            // backgroundImage: AssetImage("assets/png/empty.png"),
                            child: Icon(Icons.folder_open_rounded,
                                color: Palette.primary),
                          ))
                        : state is CauserieGetLoaded
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, bottom: 20, right: 20),
                                  child: CardCauserie(visites: _filteredCauseries),
                                ),
                              )
                            : state is CauserieGetLoading
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(
                                    semanticsLabel: "...",
                                    backgroundColor: Palette.primary,
                                  ))
                                : const SizedBox(),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Text(
                        "Causeries d'Aujourd'hui",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Palette.foreign),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: state is CauserieGetLoaded &&
                                state.todaysCauseries.isNotEmpty
                            ? CardToday(state.todaysCauseries)
                            : state is CauserieGetLoading
                                ? const Center(child: Text('...'))
                                : Center(
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
                                            "Aucune causerie aujourd'hui",
                                            style:
                                                TextStyle(color: Palette.foreign),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.addCauserie);
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
