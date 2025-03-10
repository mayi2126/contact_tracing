part of '../../../core/cores.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
    final TextEditingController _searchController = TextEditingController();

  List<ConnectivityResult> _connectivityResult = [];
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();

    _checkConnectivity();

    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      if (mounted) {
        setState(() {
          _connectivityResult = result;
        });
      }
    });
  }

  Future<void> _checkConnectivity() async {
    List<ConnectivityResult> result = await _connectivity.checkConnectivity();
    if (mounted) {
      setState(() {
        _connectivityResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecensementBloc()
        ..add(HandleGetRecensement("2023-01-01", DateTime.now().toString())),
      child: BlocListener<RecensementBloc, RecensementState>(
        listener: (context, state) {
          if (state is GetRecensementError) {}
        },
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: BlocBuilder<RecensementBloc, RecensementState>(
            builder: (context, state) {
              return Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    // topRight: Radius.circular(20)
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 10),
                      child: Row(
                        children: [
                          Text(
                            "Categories",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold,color: Palette.foreign,fontFamily: "Poppins"),
                          ),
                          Icon(Icons.info_outline, color: Palette.primary,size: 15,),
                        ],
                      ),
                    ),
                    // 10.verticalSpace,
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(16.0,16.0,16.0,0),
                    //   child: Container(
                    //     width: double.infinity,
                    //     height: 100,
                    //     decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.only(
                    //         topLeft: Radius.circular(20),
                    //         bottomRight: Radius.circular(20)
                    //       ),
                    //       color: Palette.primary,
                    //     ),
                        
                    //   )
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Définir une largeur fixe pour chaque CardWidget dans la Row
                          Expanded(
                            child: SizedBox(
                              width: 120, // largeur fixe
                              child: CardWidget(
                                icon: Icons.recent_actors,
                                title: "Recensements",
                                image: "assets/jpg/pre.jpg",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.mainRecensement);
                                },
                              ),
                            ),
                          ),
                          15.horizontalSpace,
                          Expanded(
                            child: SizedBox(
                              width: 120, // largeur fixe
                              child: CardWidget(
                                icon: Icons.local_activity_outlined,
                                title: "Référencement",
                                image: "assets/jpg/referer.jpg",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.mainReferencement);
                                },
                              ),
                            ),
                          ),
                          // 15.horizontalSpace,
                          // Expanded(
                          //   child: SizedBox(
                          //     width: 120, // largeur fixe
                          //     child: CardWidget(
                          //       icon: Icons.people_sharp,
                          //       title: "Contres Référés",
                          //       image: "assets/jpg/pre.jpg",
                          //       onTap: () {
                          //         Navigator.pushNamed(
                          //             context, RoutesName.mainContreRef);
                          //       },
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // 5.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: 120, // largeur fixe
                              child: CardWidget(
                                icon: Icons.health_and_safety_outlined,
                                title: "Visite A Domicile",
                                image: "assets/jpg/visite.jpg",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.visite);
                                },
                              ),
                            ),
                          ),
                          15.horizontalSpace,
                          Expanded(
                            child: SizedBox(
                              width: 120, // largeur fixe
                              child: CardWidget(
                                icon: Icons.chat,
                                title: "Suivi F/E",
                                image: "assets/jpg/suivife.jpg",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.mainSuivi);
                                },
                              ),
                            ),
                          ),
                          15.horizontalSpace,
                          Expanded(
                            child: SizedBox(
                              width: 120, // largeur fixe
                              child: CardWidget(
                                icon: Icons.handshake,
                                title: "Causerie Éducative",
                                image: "assets/jpg/causerie.jpg",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.causerie);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.verticalSpace,
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        "Récencements d'aujourd'hui",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold,fontFamily: "Poppins",color: Palette.foreign),
                      ),
                    ),
                    10.verticalSpace,
                    state is GetRecensementLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state is GetRecensementSuccess &&
                                _connectivityResult.first ==
                                    ConnectivityResult.none
                            ? OffLineRecWidget(
                                cards: state.offLineRecensements,
                              )
                            : state is GetRecensementSuccess &&
                                    _connectivityResult.first !=
                                        ConnectivityResult.none &&
                                    state.todaysRecensements.isEmpty
                                ? OffLineRecWidget(
                                    cards: state.offLineRecensements,
                                  )
                                : state is GetRecensementSuccess &&
                                        _connectivityResult.first !=
                                            ConnectivityResult.none &&
                                        state.todaysRecensements.isNotEmpty
                                    ? RecentTrackingWidget(
                                        cards: state.todaysRecensements,
                                      )
                                    : const Text("Aucun récencement"),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
