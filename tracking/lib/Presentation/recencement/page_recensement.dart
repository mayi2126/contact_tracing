part of '../../core/cores.dart';

class MainRecensement extends StatefulWidget {
  const MainRecensement({super.key});

  @override
  State<MainRecensement> createState() => _MainRecensementState();
}

class _MainRecensementState extends State<MainRecensement> {
  TextEditingController search = TextEditingController();

   List<TrackingCard> items = const [
     TrackingCard(),
    TrackingCard(),
    TrackingCard(),
    TrackingCard(),
    TrackingCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("La liste des recensements ...",style: TextStyle(fontSize: 16),),
            15.verticalSpace,
            RecentTrackingWidget(cards: items,),
          ],
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
