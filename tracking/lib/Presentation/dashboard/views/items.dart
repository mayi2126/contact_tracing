part of '../../../core/cores.dart';

class Items extends StatelessWidget {
  const Items({super.key});

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
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(left: 8.0,top:10),
                    child:  Text(
                      "Catégories",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  10.verticalSpace,
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
                              title: "Compte Referentiel",
                              image: "assets/jpg/pp.jpg",
                              onTap: () {},
                            ),
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                          child: SizedBox(
                            width: 120, // largeur fixe
                            child: CardWidget(
                              icon: Icons.people_sharp,
                              title: "Suivis F/E",
                              image: "assets/jpg/pre.jpg",
                              onTap: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.verticalSpace,
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
                              image: "assets/jpg/pre.jpg",
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.visite);
                              },
                            ),
                          ),
                        ),
                        15.horizontalSpace,
                        const Expanded(
                          child: SizedBox(
                            width: 120, // largeur fixe
                            child: CardWidget(
                              icon: Icons.chat,
                              title: "Dialogues",
                              image: "assets/jpg/pre.jpg",
                            ),
                          ),
                        ),
                        15.horizontalSpace,
                        Expanded(
                          child: SizedBox(
                            width: 120, // largeur fixe
                            child: CardWidget(
                              icon: Icons.handshake,
                              title: "Causeries Éducatives",
                              image: "assets/jpg/cauEdu.jpeg",
                              onTap: () {
                                Navigator.pushNamed(context, RoutesName.causerie);
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
                    child:  Text(
                      "Récencements récents",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  10.verticalSpace,
                  state is GetRecensementLoading ? const CircularProgressIndicator() : state is GetRecensementSuccess ?  RecentTrackingWidget(
                    cards: state.todaysRecensements,
                  ): const Text("Aucun récencement"),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
