part of '../../../core/cores.dart';

class RecentTrackingWidget extends StatelessWidget {
  const RecentTrackingWidget({super.key, required this.cards});
  final List<Recensement> cards;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: const BoxDecoration(
                      color: Palette.bgGrey,

              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: cards.isEmpty ? [const Text("Aucun recensement trouvé")] :  cards.map((rec) {
              return TrackingCard(
                recensement: rec,
                onTap: () => Navigator.pushNamed(context, RoutesName.showRecensement, arguments: rec),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
