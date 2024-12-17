part of '../../core/cores.dart';

class MainReferencement extends StatefulWidget {
  const MainReferencement({super.key});

  @override
  State<MainReferencement> createState() => _MainReferencementState();
}

class _MainReferencementState extends State<MainReferencement> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReferencementBloc()..add(GetReferencementEvent()),
      child: Scaffold(
        backgroundColor: Palette.primary,
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
                          Icons.filter_alt_sharp,
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
        body: BlocBuilder<ReferencementBloc, ReferencementState>(
          builder: (context, state) {
            if (state is ReferencementGetLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ReferencementGetLoaded) {
              return  state.referencements.isEmpty ?   Container(
                color: Palette.white,
                width: double.infinity,
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
                        "Aucun Cible",
                        style: TextStyle(color: Palette.foreign),
                      ),
                    ],
                  ),
                ),
              ) : Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Palette.white,
                    ),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: <Widget>[
                        SliverGrid(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Deux éléments par ligne
                            crossAxisSpacing:
                                5, // Espacement horizontal entre les éléments
                            mainAxisSpacing:
                                2, // Espacement vertical entre les éléments
                            // Définir un ratio d'aspect qui donne la hauteur désirée
                            childAspectRatio: 1, // La largeur est 2x la hauteur
                          ),
                          delegate: SliverChildListDelegate(
                            
                              state.referencements
                                  .map((referencement) => ReferencementCard(
                                        referencement: referencement,
                                      ))
                                  .toList(),
                            
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is ReferencementGetError) {
              return Center(child: Text(state.errorMessage));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
