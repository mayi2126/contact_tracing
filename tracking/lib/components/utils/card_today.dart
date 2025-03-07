part of '../../core/cores.dart';

class CardToday extends StatelessWidget {
  const CardToday(this.causeries, {super.key});
  final List<VisiteModel> causeries;

  @override
  Widget build(BuildContext context) {
    // print(causeries);
    return Column(
      children: causeries
          .map(
            (causerie) => Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Palette.primary),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                     Text(causerie.lieuAp,
                        style: const TextStyle(
                            color: Palette.primary,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Container(
                      width: getWidth(120),
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.primary),
                          borderRadius: BorderRadius.circular(20)),
                      child:  Text(" ${causerie.libelementdedonnee}",
                          style: const TextStyle(color: Palette.primary),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
