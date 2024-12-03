part of '../../core/cores.dart';

class CauseriePage extends StatefulWidget {
  const CauseriePage({super.key});

  @override
  State<CauseriePage> createState() => _CauseriePageState();
}

class _CauseriePageState extends State<CauseriePage> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CauserieBloc()..add(const GetCauseries("2023-01-01", "2024-12-31")),
      child: Scaffold(
        appBar: AppBar(
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
                            controller: search,
                            hintText: "Recherche ...",
                            labelText: "Recherche..."),
                      ),
                      // const Spacer(),
                      2.horizontalSpace,
                      IconButton(
                        onPressed: () {},
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
        body: const CauserieList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.addCauserie);
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

class CauserieList extends StatelessWidget {
  const CauserieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CauserieBloc, CauserieState>(
      listener: (context, state) {
        if (state is CauserieGetError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is CauserieGetSearch) {
          context
              .read<CauserieBloc>()
              .add( GetCauseries("2023-01-01", DateFormat('yyyy-MM-dd').format(DateTime.now())));
        }
      },
      child: BlocBuilder<CauserieBloc, CauserieState>(
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
                            child: CardVisiteCauserie(visites: state.causeries),
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
                  child: state  is CauserieGetLoaded ?
                      CardToday( state.todaysCauseries) : const SizedBox(),
                  
                 
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
