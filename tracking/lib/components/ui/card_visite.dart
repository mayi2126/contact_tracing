part of '../../core/cores.dart';

class CardVC extends StatelessWidget {
  const CardVC({super.key, required this.visite});

  final VisiteModel visite;

  @override
  Widget build(BuildContext context) {

    DateTime dateTime = DateTime.parse(visite.dateEnreg);

    // Formater la date sans l'heure en utilisant 'd MMMM yyyy'
    String formattedDate = DateFormat('d MMMM yyyy','fr').format(dateTime);


    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        height: getHeight(130),
        width: getWidth(200),
        decoration: BoxDecoration(
            border: Border.all(color: Palette.primary),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: getWidth(120),
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  decoration: BoxDecoration(
                      border: Border.all(color: Palette.primary),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    visite.libelementdedonnee,
                    style: TextStyle(color: Palette.primary),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                   Navigator.pushNamed(context, RoutesName.showVisiteAndCauserie, arguments: visite);
                  },
                  child: Icon(Icons.arrow_forward_ios_outlined,
                      size: 15, color: Palette.primary),
                )
              ],
            ),
            20.verticalSpace,
            Text(
              visite.lieuAp,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Palette.primary),
            ),
            Spacer(),
            Text(
              formattedDate,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Palette.foreign,
                  fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
