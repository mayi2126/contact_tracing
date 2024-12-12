part of '../../core/cores.dart';

class MainRecensement extends StatefulWidget {
  const MainRecensement({super.key});

  @override
  State<MainRecensement> createState() => _MainRecensementState();
}

class _MainRecensementState extends State<MainRecensement> {
  TextEditingController search = TextEditingController();

  //  List<TrackingCard> items = const [
  //    TrackingCard(),
  //   TrackingCard(),
  //   TrackingCard(),
  //   TrackingCard(),
  //   TrackingCard(),
  // ];

  /// Page d'accueil des recensements.
  ///
  /// Cette page affiche la liste des recensements.
  ///
  /// Elle comporte une barre de recherche en haut,
  /// un bouton "Ajouter" pour ajouter un recensement,
  /// et une liste des recensements en-dessous.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecensementBloc()
        ..add(HandleGetRecensement("2023-01-01", DateTime.now().toString())),
      child: Scaffold(
        appBar: AppBar(
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
        body: BlocBuilder<RecensementBloc, RecensementState>(
          builder: (context, state) {
            return Padding(
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

                  state is GetRecensementSuccess
                      ? RecentTrackingWidget(cards: state.recensements)
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
            );
          },
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
      ),
    );
  }
}
