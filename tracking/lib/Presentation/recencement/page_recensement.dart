part of '../../core/cores.dart';

class InnerRecencement extends StatefulWidget {
  const InnerRecencement({super.key});

  @override
  State<InnerRecencement> createState() => _InnerRecencementState();
}

class _InnerRecencementState extends State<InnerRecencement> {
  final TextEditingController _searchController = TextEditingController();

  List<Recensement> _filteredRecensements = [];
  List<Recensement> _filteredRecensementsAll = [];
  List<ConnectivityResult> _connectivityResult = [];
  final Connectivity _connectivity = Connectivity();
  bool isInternetAvailable = true;

  @override
  void dispose() {
    _searchController.dispose();
    _searchController.removeListener(_filterReferencements);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterReferencements);
    _checkConnectivity();
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (mounted) {
        setState(() {
          _connectivityResult = result;

          // if (_connectivityResult.first != ConnectivityResult.none) {
          //   BlocProvider.of<RecensementBloc>(context).add(
          //       HandleGetRecensement("2023-01-01", DateTime.now().toString()));
          // }
        });
      }
    });
  }

  Future<void> _checkConnectivity() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    if (result.first == ConnectivityResult.none) {
      // Si pas de connexion internet, afficher un message d'erreur
      if (mounted) {
      setState(() {
        isInternetAvailable = false;
      });
      }
    }
  }

  void _filterReferencements() {
    String query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        _filteredRecensements = _filteredRecensementsAll;
      }
      // Filtrer les `contreReferencements` en fonction de la recherche
      _filteredRecensements = _filteredRecensementsAll
          .where((referencement) =>
              referencement.membrenomrec.toLowerCase().contains(query) ||
              referencement.membreprenomrec.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Recensements",
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
                      labelText: "Recherche...",
                    ),
                  ),
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
          ),
        ),
      ),
      body: BlocListener<RecensementBloc, RecensementState>(
        listener: (context, state) {
          if (state is GetRecensementSuccess) {
            _filteredRecensementsAll = state.recensements;
            _filteredRecensements = state.recensements;
          }
        },
        child: BlocBuilder<RecensementBloc, RecensementState>(
          builder: (context, state) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "La liste des recensements ",
                      style: TextStyle(fontSize: 16),
                    ),
                    15.verticalSpace,
                    // state is GetRecensementLoading() ? const Center(
                    //   child: CircularProgressIndicator(),
                    // ): state is GetRecensementSuccess() ?

                    // RecentTrackingWidget(cards: state.recensements,),
                    !isInternetAvailable ? const Padding(
                      padding:  EdgeInsets.only(top: 20, bottom: 20),
                      child:  Center(
                          child: CircleAvatar(
                            backgroundColor: Palette.bgGrey,
                            radius: 30,
                            child: Icon(
                              Icons.wifi_off,
                              color: Palette.foreign,
                              size: 30,
                            ),
                          ),
                        ),
                    ): const SizedBox(),

                    state is GetRecensementSuccess
                        ? RecentTrackingWidget(cards: _filteredRecensements)
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    state is GetRecensementError
                        ? Center(
                            child: Text(state.message),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addRecensement);
        },
        backgroundColor: Palette.primary,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Palette.white,
        ),
      ),
    );
  }
}

class MainRecensement extends StatelessWidget {
  const MainRecensement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecensementBloc()
        ..add(HandleGetRecensement("2023-01-01", DateTime.now().toString())),
      child: const InnerRecencement(),
    );
  }
}
