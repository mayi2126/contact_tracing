part of '../../core/cores.dart';

class InnerMainSuivi extends StatefulWidget {
  const InnerMainSuivi({super.key});

  @override
  State<InnerMainSuivi> createState() => _InnerMainSuiviState();
}

class _InnerMainSuiviState extends State<InnerMainSuivi> {
  final TextEditingController _searchController = TextEditingController();
  List<Referencement> _filtedPatients = [];
  List<Referencement> _filtedPatientsAll = [];
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
          "Suivi des femmes enceintes",
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<SuiviBloc, SuiviState>(
            listener: (context, state) {
              if (state is GetPatientsSuccess) {
                _filtedPatients = state.patients;
                _filtedPatientsAll = state.patients;
              }
            },
          ),
        ],
        child: BlocBuilder<SuiviBloc, SuiviState>(
          builder: (context, state) {
            return Container(
              padding: const EdgeInsets.all(15),
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Palette.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("On danse"),
                   Expanded(
                      child: CustomScrollView(
                    scrollBehavior:  MaterialScrollBehavior(),
                    slivers: state is GetPatientsSuccess ?
                        _filtedPatients.map((patient) => CardSuivi(patient: patient,)).toList() : state is GetPatientsLoading ? [ const SliverAppBar.large(
                          automaticallyImplyLeading: false,
                          backgroundColor: Palette.white,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Center(child: CircularProgressIndicator()),
                          ),
                        )]:[ const SliverAppBar.large(
                          automaticallyImplyLeading: false,
                          backgroundColor: Palette.white,
                          flexibleSpace: FlexibleSpaceBar(
                            
                            background: Center(child: Text("Erreur")),
                          ),
                        )],
                    // [
                    //   SliverAnimatedList(
                    //     itemBuilder: (context, index, animation)

                        
                    // [
                    //   SliverAnimatedList(
                    //     itemBuilder: (context, index, animation) {
                    //       return SlideTransition(
                    //         position: Tween<Offset>(
                    //           begin: const Offset(0, 1),
                    //           end: Offset.zero,
                    //         ).animate(animation),
                    //         child: Container(
                    //           margin: const EdgeInsets.only(bottom: 15),
                    //           padding: const EdgeInsets.all(15),
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Palette.stroke,
                    //           ),
                    //           child: const Text("df"),
                    //         ),
                    //       );
                    //     },
                    //   ),

                    //   _filtedPatients.map(toElement => SliverToBoxAdapter()).toList(),
                    // ],
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardSuivi extends StatelessWidget {
  const CardSuivi({
    super.key, required this.patient,
  });
  final Referencement patient;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Palette.bgGrey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                10.horizontalSpace,
                 Text(
                  " ${patient.prestatairesoins}",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                8.horizontalSpace,
                const Text("|"),
                8.horizontalSpace,
                 Text(
                  "${patient.fullName}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Palette.textSuccess),
                ),
                const Spacer(),

                patient.grossesseconfirme == null ? SizedBox() :  patient.grossesseconfirme == "Oui" ?
                const Icon(
                  Icons.check_circle_outline_outlined,
                  color: Palette.textSuccess,
                ): const SizedBox(),
                15.horizontalSpace,
              ],
            ),
            5.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                dateStringFormat(patient.dateprochainrdv),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color: Palette.danger),
              ),
            ),
            10.verticalSpace,
            const Text("Recommandation",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Palette.foreign)),
            3.verticalSpace,
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  // color: Palette.bgGrey,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: Palette.primary,
                    size: 20,
                  ),
                  5.horizontalSpace,
                  Text(
                    "${patient.recommandation}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            2.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Village",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Palette.foreign)),
                      3.verticalSpace,
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            // color: Palette.bgGrey,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.arrow_downward_outlined,
                              color: Palette.primary,
                              size: 20,
                            ),
                            5.horizontalSpace,
                             Text(
                              "${patient.nomvillage}",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Quartier",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Palette.foreign)),
                        3.verticalSpace,
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: Palette.bgGrey,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_upward_outlined,
                                color: Palette.textSuccess,
                                size: 20,
                              ),
                              5.horizontalSpace,
                               SizedBox(
                                width: 50,
                                 child: Text(
                                  "${patient.nomquartier}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                                               ),
                               ),
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MainSuivi extends StatelessWidget {
  const MainSuivi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SuiviBloc()..add(GetPatientsEvent())),
      ],
      child: const InnerMainSuivi(),
    );
  }
}
