part of '../../core/cores.dart';

class CardVC extends StatelessWidget {
  const CardVC({super.key, required this.visite});

  final VisiteModel visite;

  @override
  Widget build(BuildContext context) {

    String firstLetter = visite.libelementdedonnee.substring(0, 1);

// Find the index of the space and extract the first letter of the second word (Partenaire)
int spaceIndex = visite.libelementdedonnee.indexOf(' ');
String secondLetter = visite.libelementdedonnee.substring(spaceIndex + 1, spaceIndex + 2);

// Combine the letters to form "TP"
String result = firstLetter + secondLetter;

    return  Padding(
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
                      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                      decoration: BoxDecoration(
                          border: Border.all(color: Palette.primary),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(result,
                          style: TextStyle(color: Palette.primary)),
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios_outlined,
                        size: 15, color: Palette.primary)
                  ],
                ),
                20.verticalSpace,
                Text(
                  visite.lieuAp,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Palette.primary),
                ),
                Spacer(),
                Text(
                  visite.dateEnreg.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Palette.foreign,
                      fontSize: 12),
                ),
              ],
            ),
          ),
    )
        ;
  }
}